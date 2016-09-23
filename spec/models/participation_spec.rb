require 'rails_helper'

RSpec.describe Participation, type: :model do
 
	before	do
		ProjCategory.create!(name:"使命感行動")
		ProjStatus.create!(name:"執行中")
		@project = Project.create(name:"xx", category_id: 1 , status_id: 1)
		@group = Group.create!(name:"台北班")
		@user1 = User.create!(name:"xx", email:"12345@gmail.com", password:"12345678")
		@user2 = User.create!(name:"aa", email:"2342352@gmail.com", password:"12345678")
		

		PartiStatus.create!(name:"進行中")
		@participation = Participation.create(group: @group, project: @project, user: @user1, status_id:1 )


	end

	it "status exists" do

		status = Participation.status(@project, @user1)

		expect(status).to eq("進行中")
	end

end
