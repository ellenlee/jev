require 'rails_helper'

RSpec.describe UsersController, type: :controller do

before do 
  # allow(controller).to receive("/admin/users")    
	@user1 = User.create(name:"xx", email:"xxxx@gmail.com", password:"12345678")
	@user2 = User.create(name:"aa", email:"xxxx@gmail.com", password:"12345678")
	
end 
 
 	it "get index" do
 		current_user = @user1
 		expect(current_user.admin?).to eq(true)
 		expect(@user2.admin?).to eq(false)
 	end

	# # it "@user1 is admin?" do
	# 	expect(@user1.admin?).to eq(true)
	# 	expect(@user2.admin?).to eq(false)
	# end

end
