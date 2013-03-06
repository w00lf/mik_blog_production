require 'spec_helper'

describe "Devise features testing", :type=>:feature do
	context 'Register new user' do
		it 'Create new user and send confirm email' do
			visit '/users/sign_up'
			page.should have_content I18n.t("devise.registrations.new")
			page.should have_content I18n.t("helpers.placeholder.user.login")
			page.should have_content I18n.t("helpers.placeholder.user.password")
			user = FactoryGirl.build(:user)
			#ActionMailer::Base.should_receive(:deliver_signup).with(user.email)
			expect {
				within '#content_area #new_user' do
					fill_in 'user_username', with: user.username
					fill_in 'user_email', with: user.email
					fill_in 'user_password', with: user.password
					fill_in 'user_password_confirmation', with: user.password
					find("input[name='commit']").click()
				end
			}.to change(User, :count).by(1)
			
			ActionMailer::Base.deliveries.empty?.should_not be true
			sign_email = ActionMailer::Base.deliveries.first
			sign_email.to.should have_content user.email
			sign_email.subject.should have_content  I18n.t("devise.mailer.confirmation_instructions.subject")
		end
	end
end