class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teams, :through =>:team_memberships
	has_many :team_memberships, :dependent => :destroy

	# has_many :team_tasks, :through =>:task_achieved, :source => :team
	has_many :tasks, :through =>:task_achieved
	has_many :task_achieved, :dependent => :destroy


end
