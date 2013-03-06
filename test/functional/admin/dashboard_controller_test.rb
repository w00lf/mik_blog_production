require 'test_helper'
require_relative 'admin_setup.rb'

class Admin::DashboardControllerTest < Admin::AdminTests

  	test "user without permission cant access dashboard" do
		login_as_casual_user()
		get :index
		assert_response :redirect
	end

	test "admin can access dashboard" do
		login_as_admin()
		get :index
		assert_response :success
	end

end
