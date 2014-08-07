class SessionsController < ApplicationController
	def create
		#1. get user based on email
		#2. jika user ada authentifikasi dengan password yang di submit
		#3. handle respose

		user = User.find_by(email: params[:email])
		respond_to do |format|
			if user && user.authenticate(params[:password])
				format.html do
			#login successfully
			session[:user_id] = user.id
			redirect_to maps_path, notice: "Logged In !"
		end
		format.json {render json: user}
	else
		format.html do
			flash.now.alert = "Invalid email or password"
			render :new
		end
		format.json {render json: "Invalid email or password"}
	end
end
end
def destroy
	session[:user_id] = nil
	redirect_to maps_path, notice: "Logged out !"
end
end
