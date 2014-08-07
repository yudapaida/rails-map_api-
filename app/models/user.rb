class User < ActiveRecord::Base
	has_secure_password
	#callback
	#before_create
	#before_validates
	#after_update, dll

	before_create :set_auth_token
	validates :email, presence: true, uniqueness: true
	
	#code diatas berisi
	#user.authentication("password")
	#nambahin 2 password & password_confirmation
	#nambahin validasi pass dan pass_confirmation

	def set_auth_token
	#looping dan generate number
	#brake dari loop kalo ketemu number yg blm dipake
	self.auth_token = loop do
		token = SecureRandom.hex
		break token unless self.class.exists?(auth_token: token)
	end
end
end
