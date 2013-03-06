require 'spec_helper'

describe 'Posts features', :type=>:feature do
	before(:each) do  
    	capybara_login_admin
	end

	it "should delete comment with ajax", js: true do
		post = FactoryGirl.create(:post)
		comment = FactoryGirl.create(:comment, :content => 'destroied comment', :post_id => post.id)
		visit "/posts/#{post.id}"
		expect {
			within "#comment#{comment.id}" do
				find('.delete_comment').click()
				sleep 1
				alert = page.driver.browser.switch_to.alert
    			alert.accept
    			sleep 1
			end
		}.to change(Comment,:count).by(-1)
		within '#comments' do
			page.should_not have_content comment.content
		end
	end
end