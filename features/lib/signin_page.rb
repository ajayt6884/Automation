class Signin < SitePrism::Page
	
	element :email, "#spree_user_email"
	element :password, "#spree_user_password"
	element :signin, ".btn"

	def signin_with(email,password)
		self.email.set "#{email}"
		self.password.set "#{password}"
	end

end