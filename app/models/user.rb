class User < ApplicationRecord
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

	# 查詢特定專案下使用者參與記錄
	# scope :attend, -> (id) {
	# 	self.participations.where(project_id: id) }

		# scope :member, -> (user,project) {
		# where(user: user, project: project)}

	def admin?
		if self.id == 1
			true
		else
			false
		end
	end
end
