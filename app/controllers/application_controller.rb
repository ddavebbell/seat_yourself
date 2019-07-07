class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper

  def ensure_logged_in
    redirect_to root_url if current_user == nil
    flash[:alert] = "You must create an account"
  end

end
