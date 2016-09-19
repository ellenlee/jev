class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :participants, :dependent => :destroy
	has_many :projects, :through => :participants

	has_many :tasks, :through =>:uploads
	has_many :uploads, :dependent => :destroy


end
