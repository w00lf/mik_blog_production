require 'test_helper'
require_relative 'admin_setup.rb'

class Admin::ArticlesControllerTest < Admin::AdminTests
	setup do
    	@article = articles(:three)
  	end

  	test "user without permission cant create article" do
		login_as_casual_user()
		assert_no_difference('Article.count') do
			post :create, article: {:title =>'fdsfds', :name => 'name', :content => 'dfsfsdfsd sfgsd'}
		end

		assert_response :redirect
	end

	test "admin can create article" do
		login_as_admin()
		assert_difference('Article.count') do
			post :create, article: {:title =>'fdsfds', :name => 'name', :content => 'dfsfsdfsd sfgsd'}
		end

		assert_redirected_to admin_articles_url
	end

	
end
