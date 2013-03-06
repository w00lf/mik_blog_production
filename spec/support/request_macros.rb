module HelperMethods
  def logout_user(user = @current_user)
    Capybara.reset_sessions!
    visit destroy_user_session_url
  end

  def capybara_login_admin
    visit '/'
    user_admin = FactoryGirl.create(:admin)
    within 'form#new_user' do
      fill_in 'user_email', with: user_admin.email
      fill_in 'user_password', with: user_admin.password
      click_button "login_site"
    end
  end
  def capybara_login_user
    visit '/'
    user_admin = FactoryGirl.create(:user)
    within 'form#new_user' do
      fill_in 'user_email', with: user_admin.email
      fill_in 'user_password', with: user_admin.password
      click_button "login_site"
    end
  end
end