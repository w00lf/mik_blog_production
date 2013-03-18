class ApplicationController < ActionController::Base
  protect_from_forgery  
  
  include ReCaptcha::AppHelper

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  protected

  def verify_admin
    if current_user != nil && !current_user.admin?
      redirect_to :root, :alert => t(:access_denied)
    elsif current_user == nil || !current_user.admin?
      redirect_to "/users/sign_in", :alert => t(:access_denied)
    end
  end
end
