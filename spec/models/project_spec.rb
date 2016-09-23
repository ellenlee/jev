require 'rails_helper'

RSpec.describe Project, type: :model do
  
	before	do
		@user1 = User.create!(name:"xx", email:"12345@gmail.com", password:"12345678")
		@user2 = User.create!(name:"aa", email:"2342352@gmail.com", password:"12345678")
		Status.create!(name:"已結案")
		Category.create!(name:"使命感行動")
		@project = Project.new(name:"xx", category_id: 1 , status_id: 1)
		@project.creator = @user2
	end

	it "create new project " do
		expect(@project.creator).to eq(@user2)
	end

	it " project.id " do
		expect(@project.id).to eq(nil)
	end

	it	"save" do
		@project.category_id = 1
		@project.status_id = 1
		@project.save
		expect(@project.errors.full_messages).to eq([])
		expect(@project.save).to eq(true)
		expect(@project.id).to eq(1)
		expect(@project.creator).to eq(@user2)
	end

end
