require 'rails_helper'

RSpec.describe User, type: :model do

	before	do
		@user1 = User.create(name:"xx", email:"xxxx@gmail.com", password:"12345678")
		@user2 = User.create(name:"aa", email:"xxxx@gmail.com", password:"12345678")
	end
 
 	it "exist?" do
 		expect(@user1.id).to eq(1)
 	end

	it "@user1 is admin?" do
		expect(@user1.admin?).to eq(true)
		expect(@user2.admin?).to eq(false)
	end

end
