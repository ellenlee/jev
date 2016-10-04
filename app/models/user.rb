class User < ApplicationRecord
	require 'csv'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :email
  # validates_format_of :phone

  has_many :projects # as creator if admin
  
	has_many :groups, through: :participations
  has_many :projects, through: :participations
  has_many :participations, dependent: :destroy

  has_many :lessons, through: :groups
  has_many :attendances
  has_many :attend_lessons, through: :attendances, source: :lesson

  has_many :assignments, through: :groups
  has_many :uploads
  has_many :team_uploads, through: :teams, class_name: "Upload"

  has_many :teammateships, dependent: :destroy
  has_many :teams, through: :teammateships

  def admin?
    if AdminList.find_by_email(self.email).present?
      true
    else
      false
    end
  end

	def group(project)
		self.participations.where(project: project).first.group
	end

	def status(project)
		self.participations.where(project: project).first.status.name
	end

  def tasks(project)
    group = self.group(project)
    tasks = project.tasks & group.tasks
  end

  def active_team(project)
    team_in_project = self.teams & project.teams
    active_team = self.teammateships.where(team: team_in_project, active: true)
    if active_team.exists?
      active_team.first.team
    end
  end

  def active_team_num(project)
    active_team = self.active_team(project)
    if active_team
      active_team.num
    else
      "-"
    end
  end

  def quit(team)
    active_record = self.teammateships.where(team:team, active: true).first
    if active_record.present?
      active_record.update(actiive: false)
    end
  end

  def attendance(lesson)
    record = self.attendances.where(lesson: lesson)
    if record.any?
      record.first
    else
      self.attendances.new(user: self, lesson: lesson)
    end
  end

  def personal_uploads(project, group)
    tasks_should_be_done = Task.personal_tasks(project, group)
    self.uploads.where(task: tasks_should_be_done)
  end

  def personal_uploads_count(project, group)
    personal_uploads = self.personal_uploads(project, group)
    personal_uploads.count
  end

  def team_uploads(project, group)
    tasks_should_be_done = Task.team_tasks(project, group)
    if team = self.active_team(project)
      team.uploads.where(task: tasks_should_be_done)
    end
  end

  def team_uploads_count(project, group)
    if team = self.active_team(project)
      team_uploads = self.team_uploads(project, group)
      team_uploads.count
    else
      0
    end
  end

  def project_uploads_count(project, group)
    self.personal_uploads_count(project, group) + self.team_uploads_count(project, group)
  end

  def total_uploads_count
    count = 0
    participations = self.participations.where(status: [1,3]) 
    participations.each do |part|
      project = part.project
      group = part.group
      count += project_uploads_count(project, group)
    end
    count
  end  

	def self.import(file, creator, project, group)
		
    CSV.foreach(file.path, headers: true, encoding:'BIG5:utf-8') do |row|
      user_hash = row.to_hash 
      user = User.where(email: user_hash["email"])

      # Create User or not?
      if user.count == 0
    		user = User.create!(name: user_hash["name"], email: user_hash["email"], password: user_hash["email"], phone: user_hash["phone"], created_by: creator.id)
    	else 
    		user.first.update_attributes(name: user_hash["name"], email: user_hash["email"],phone: user_hash["phone"])
        user = user.first
    	end
    	# Create Participation or just Update?
    	participation = user.participations.where(project: project)
    	if participation.count == 0 
    		user.participations.create!(project: project, group: group, status_id: 1)
      elsif participation.first.group != group
        participation.first.update(group: group, status_id: 1)
      else
    		participation.first.update(status_id: 1)
      end
      
      # Create Team or not?
      team = project.teams.where(group: group, num: user_hash["team"])
      if team.count == 0
        team = project.teams.create!(group: group, num: user_hash["team"])
      else
        team = team.first
      end

      # Update TeamMembership first, or just Create?
      membership = user.teammateships.where(active: true)
      # User already active in the other team? (Update first)
      if membership.count >= 1 && membership.where(team: team).count == 0
        membership.each do |membership|
          membership.update(active: false, quit_on: Date.today)
        end
      end
      # User already in this team? (just update)
      if user.teams.include?(team)
        membership = user.teammateships.where(team: team).first
        membership.update(active: true, quit_on: nil)
      end
      # Create but ignore the same record
      new_record = Teammateship.create(team: team, user: user)
    end
  end
end
