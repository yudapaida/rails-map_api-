class User < ActiveRecord::Base
	has_secure_password
	validates :email, presence: true, uniqueness: true
	
	#code diatas berisi
	#user.authentication("password")
	#nambahin 2 password & password_confirmation
	#nambahin validasi pass dan pass_confirmation
end
