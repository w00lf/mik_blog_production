class Admin::DashboardController < ApplicationController
  before_filter :verify_admin

  def index
  end

  private

  def verify_admin
  	if current_user != nil && !current_user.admin?
  		redirect_to :root, :alert => t(:access_denied)
  	elsif current_user == nil || !current_user.admin?
  		redirect_to "/users/sign_in", :alert => t(:access_denied)
  	end
  end
end
