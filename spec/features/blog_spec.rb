require 'spec_helper'

describe 'Blog features',:type=>:feature do
	it 'should show posts index' do	
		capybara_login_user	
		tags = ['foo', 'ruby']
		post_1 = FactoryGirl.create(:post, :postTag_list=>tags[0])
		post_2 = FactoryGirl.create(:second_post, :postTag_list=>tags[1])
		visit '/'
		
	    page.should have_content I18n.t(:main_title)
		page.should have_content tags[0]
		page.should have_content tags[1]
		page.should have_content post_1.title
		page.should have_content post_2.title
		post_1_first_word = post_1.content.split(' ')[0]
		page.should have_content post_1_first_word
	end
	
	it 'should visit blog root page with firefox' do			
		headless = Headless.new(display: 100, reuse: true, destroy_at_exit: false)
		headless.start
		Capybara.current_driver = :selenium
		FactoryGirl.create(:post)
		capybara_login_user
		page.should have_content I18n.t(:tegs)
		page.should have_content I18n.t(:comments)
	
		filename = File.join(File.dirname(__FILE__), "#{Time.now.strftime("%Y-%m-%d-%H-%M-%S")}_name.png")
		page.driver.browser.save_screenshot(filename)		
	end
end
