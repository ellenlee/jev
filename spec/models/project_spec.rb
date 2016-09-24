require 'rails_helper'

RSpec.describe Project, type: :model do
  
	before	do
		@user1 = User.create!(name:"xx", email:"12345@gmail.com", password:"12345678")
		@user2 = User.create!(name:"aa", email:"2342352@gmail.com", password:"12345678")

		ProjCategory.create!(name:"使命感行動")
		ProjStatus.create!(name:"執行中")
		@project = Project.create!(name:"xx", category_id: 1 , status_id: 1, creator: @user1)
		@group = Group.create!(name:"台北班")
		
		PartiStatus.create!(name:"進行中")
		@participation1 = Participation.create!(group: @group, project: @project, user: @user1, status_id:1 )
		@participation2 = Participation.create!(group: @group, project: @project, user: @user2, status_id:1 )
	
	end

	it "create new project " do
		expect(@project.creator).to eq(@user1)
	end

	it "members in group" do
		expect(@project.participants(@group)).to eq(Participation.where(project: @project, group: @group))
	end
end
