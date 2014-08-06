class SessionsController < ApplicationController
	def create
		#1. get user based on email
		#2. jika user ada authentifikasi dengan password yang di submit
		#3. handle respose

		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			#login successfully
			session[:user_id] = user.id
			redirect_to maps_path, notice: "Logged In !"
		else
			flash.now.alert = "Invalid email or password"
			render :new
		end
		
	end
	def destroy
		session[:user_id] = nil
		redirect_to maps_path, notice: "Logged out !"
	end
end
