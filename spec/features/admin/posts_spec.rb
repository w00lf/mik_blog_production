require 'spec_helper'

describe 'Posts features', :type=>:feature do
	before(:each) do  
    	capybara_login_admin
	end

	it 'should show new created post' do
		tags = ['foo', 'ruby']
		post_attributes = FactoryGirl.build(:post)

		expect{
	        find('#create_new').click()
	        within 'form#new_post' do
		        fill_in 'post_title', with: post_attributes.title
		        fill_in 'post_postTag_list', with: tags.join(',')
		        fill_in 'post_content', with: post_attributes.content
		        click_button "create_post"
		    end
	      }.to change(Post,:count).by(1)
	    page.should have_content I18n.t(:main_title)
		page.should have_content tags[0]
		page.should have_content post_attributes.title
		content_first_word = post_attributes.content.split(' ')[0]
		page.should have_content content_first_word
	end
end