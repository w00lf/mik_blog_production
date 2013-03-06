ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
	# Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
	#
	# Note: You'll currently still have to declare fixtures explicitly in integration tests
	# -- they do not yet inherit this setting
	fixtures :all

  
	def login_as_admin
		if(@logined != nil)
			sign_out :user
		end
		@request.env["devise.mapping"] = Devise.mappings[:user]
		sign_in users(:admin)
		@logined = true
	end

	def login_as_casual_user
		if(@logined != nil)
			sign_out :user
		end
		@request.env["devise.mapping"] = Devise.mappings[:user]
		sign_in users(:casual)
		@logined = true
	end

  # Add more helper methods to be used by all tests here...
  
end
