require 'spec_helper'

describe 'admins\new.html.erb', type: :view do
	it 'displays details correctly'do
		
		@user= create(:admin)
		assigns(:user)
		puts @user.user.name
		puts @user.user.profile_type
		render 'new' :formats => :html
	end
end 
