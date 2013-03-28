class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
    proceed_login()
  end

  def vkontakte
    proceed_login()
  end

  def google_oauth2
    proceed_login()
  end

  def twitter
    proceed_login()
  end

  def github
    proceed_login()
  end

  def yandex
    proceed_login()
  end

  private

  def proceed_login
    user_data = request.env["omniauth.auth"]
    @user = User.find_for_common_oauth(user_data, current_user)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => user_data.provider) if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end