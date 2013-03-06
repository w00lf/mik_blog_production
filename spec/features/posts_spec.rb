require 'spec_helper'

describe 'Posts features', :type=>:feature do
	before(:each) do  
    	capybara_login_admin
    	@post ||= FactoryGirl.create(:post)
    	visit "/posts/#{@post.id.to_s}"
	end
end