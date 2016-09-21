class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects # as creator if admin

	has_many :participants, dependent: :destroy
	has_many :projects, through: :participants

	has_many :team_memberships, dependent: :destroy
	has_many :teams, through: :team_memberships
	has_many :groups, through: :teams

	
	
	# has_many :tasks, :through =>:uploads
	# has_many :uploads, dependent: :destroy

	def admin?
		if self.id == 1
			true
		else
			false
		end
	end
end
