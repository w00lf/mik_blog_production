require 'test_helper'

class PostsControllerTest < ActionController::TestCase
	include Devise::TestHelpers
	
	setup do
		@post = posts(:one)
	end

	test "should show post" do
		get :show, id: @post
		assert_response :success
	end

end
