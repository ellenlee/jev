require 'rails_helper'

RSpec.describe Teammateship, type: :model do

	before	do
		# user
		@user1 = User.create!(name:"xx", email:"12345@gmail.com", password:"12345678")

		#project, group
		ProjCategory.create!(name:"使命感行動")
		ProjStatus.create!(name:"執行中")
		@project = Project.create!(name:"xx", category_id: 1 , status_id: 1, creator: @user1)
		@group = Group.create!(name:"台北班")
		
		PartiStatus.create!(name:"進行中")
		@participation1 = Participation.create!(group: @group, project: @project, user: @user1, status_id:1 )
	
		#teams
		@team1 = Team.create!(project: @project, group: @group, num:1)
		@team2 = Team.create!(project: @project, group: @group, num:2)
	end

	context 'validate_active_user_uniquess_in_project' do
		it "user hasn't join any team" do
	 		expect(@user1.teams.count).to eq(0)
	 		expect(@project.teams.ids).to eq([1,2])
	 		expect(@user1.teams.ids).to eq([])
	 	end

	 	it "user join 1st team" do
	 		@user1.teams << @team1
	 		tm = @user1.teammateships.where(team: @team1)
	 		expect(tm.count).to eq(1)
	 		expect(tm.first.active).to eq(true)
	 		expect(@project.teams.ids).to eq([1,2])
	 		expect(@user1.teams.ids).to eq([1])
	 		expect(@user1.teammateships.pluck(:team_id)).to eq([1])
	 	end

	 	it "user cannot join 2nd team before quit origin one" do
	 		@user1.teams << @team1
	 		
	 		expect{
	 			@user1.teams << @team2
	 			}.to raise_error(ActiveRecord::RecordInvalid)
	 	end

	 	it "should update origin teammateship record" do
	 		@user1.teams << @team1
	 		tm = @user1.teammateships.where(team: @team1).first
	 		tm.active = false
	 		expect(tm.save).to eq(true)
	 	end
	end
end
