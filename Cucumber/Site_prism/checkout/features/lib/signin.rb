class Signin < SitePrism::Page

  element :email, "#sign_in_email"
  element :password, "#sign_in_password"
  element :signin, "#signin-btn"

  def signin_with(email,password)
    self.email.set "#{ email }"
    self.password.set "#{password}"
  end

end
