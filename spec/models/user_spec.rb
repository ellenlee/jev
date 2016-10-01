require 'rails_helper'

RSpec.describe User, type: :model do

	before	do
		# ProjCategory.create!(name:"使命感行動")
		# ProjStatus.create!(name:"執行中")
		# @project = Project.create!(name:"xx", category_id: 1 , status_id: 1, creator: @user1)
		# @group = Group.create!(name:"台北班")
		
		
		# PartiStatus.create!(name:"進行中")
		# @participation1 = Participation.create!(group: @group, project: @project, user: @user1, status_id:1 )
		# @participation2 = Participation.create!(group: @group, project: @project, user: @user2, status_id:1 )
	end
 
 	it "factory user exist?" do
 		expect(@user.exists?).to eq(true)
 	end


	# it "@user1 is admin?" do
	# 	expect(@user1.admin?).to eq(true)
	# 	expect(@user2.admin?).to eq(false)
	# end

	# it "user.participations exist?" do
	# 	expect(@participation1).to eq(Participation.first)
	# 	expect(@user1.participations.first).to eq(Participation.first)
	# end

	# it "get group by project" do
	# 	expect(@user1.participations.where(project: @project).first.group.name).to eq(@group.name)
	# 	expect(@user1.group(@project)).to eq(@group.name)
	# end

end
