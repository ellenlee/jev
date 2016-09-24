class User < ApplicationRecord
	require 'csv'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :email

  has_many :projects # as creator if admin

	has_many :participations, dependent: :destroy
	has_many :projects, through: :participations
	has_many :groups, through: :participations

	has_many :team_memberships, dependent: :destroy
	has_many :teams, through: :team_memberships
	
	# has_many :tasks, :through =>:uploads
	# has_many :uploads, dependent: :destroy

	def group(project)
		self.participations.where(project: project).first.group.name
	end

	def status(project)
		self.participations.where(project: project).first.status.name
	end

	def admin?
		if self.id == 1
			true
		else
			false
		end
	end

	def self.import(file, creator, project, group)
		
    CSV.foreach(file.path, headers: true) do |row|
      user_hash = row.to_hash 
      user = User.where(name: user_hash["name"])

      # Create User or not?
      if user.count == 0
    		user = User.create!(name: user_hash["name"], email: user_hash["email"], password: user_hash["email"], phone: user_hash["phone"], created_by: creator.id)
    	else 
    		user.first.update_attributes(email: user_hash["email"], phone: user_hash["phone"])
    	end

    	# Create Participation or not?
    	user = user.first
    	participation = user.participations.where(project: project)
    	if participation.count == 0 
    		user.participations.create!(project: project, group: group, status_id: 1)
      # Update Group of Participation or not?
      elsif participation.first.group != group
        participation.first.update(group: group, status_id: 1)
      else
    		participation.first.update(status_id: 1)
      end
      
      # Create Team of not?
      team = project.teams.where(group: group, num: user_hash["team"])
      if project.teams.count == 0
        Team.create(project: project, group: group, num: user_hash["team"])
      	
      end
      

    end # end CSV.foreach
  end # end self.import(file)
end
