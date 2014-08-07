class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :current_user

  #bisa dipakai di semua controller
  def current_user
    @current_user = if params[:token]
      User.find_by(auth_token: params[:token])
    else
     User.find(session[:user_id]) if session[:user_id] 	
    end
  end

  def authorize
    respond_to do |format|
      format.html { redirect_to new_session_path, alert: "Unauthorized Access" unless current_user }
      format.json { render json: "token salah" unless current_user }
    end
  end
end
