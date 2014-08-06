class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
		#respond_to do |format|
		if @user.save
			#format.html
			redirect_to maps_path, notice: 'Successfully create user'
		else 
			render :new
		end
	end
end
