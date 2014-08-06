class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :current_user

  #bisa dipakai di semua controller
  def current_user
  	@current_user = User.find(session[:user_id]) if session[:user_id] 	
  end

  def authorize
  	redirect_to new_session_path, alert: "Unauthorized Access" if !current_user
  end
end
