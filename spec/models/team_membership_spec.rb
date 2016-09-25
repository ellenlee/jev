require 'rails_helper'

RSpec.describe TeamMembership, type: :model do
  
  describe '#validate_active_user_uniquess_in_project' do
		before do
			@user1 = User.create!(name:"xx", email:"12345@gmail.com", password:"12345678")
			@user2 = User.create!(name:"aa", email:"2342352@gmail.com", password:"12345678")

			ProjCategory.create!(name:"使命感行動")
			ProjStatus.create!(name:"執行中")
			@project = Project.create!(name:"xx", category_id: 1 , status_id: 1, creator: @user1)
			@group = Group.create!(name:"台北班")
			
			@team1 = Team.create!(num: 1, project: @project, group: @group)
			@team2 = Team.create!(num: 2, project: @project, group: @group)
			@team3 = Team.create!(num: 3, project: @project, group: @group)
		end

		it "only one active user among project's teams" do
			@tm1 = TeamMembership.create!(user: @user1, team: @team1)
			@tm2 = TeamMembership.create!(user: @user1, team: @team2, active?: false)
			@tm3 = TeamMembership.create!(user: @user1, team: @team3, active?: false)
			expect(@tm1.validate_active_user_uniquess_in_project).to eq(true)
		end

		it "2 team active--> false " do
			@tm1 = TeamMembership.create(user: @user1, team: @team1)
			@tm2 = TeamMembership.create(user: @user1, team: @team2)
			@tm3 = TeamMembership.create(user: @user1, team: @team3)

			expect(@tm2.valid?).to eq false
			expect(@tm2.errors[:base]).to eq ['must quit original team first']
			expect(@tm3.valid?).to eq false
			expect(@tm3.errors[:base]).to eq ['must quit original team first']
		end
	end
end
