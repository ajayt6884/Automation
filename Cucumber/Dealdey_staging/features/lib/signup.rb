class Signup < SitePrism::Page

  element :name, "#user_firstname"
  element :email, "#user_email"
  element :password, "#user_password"
  element :confirm_password, "#user_password_confirmation"
  element :mobile, "#user_mobile"
  element :state, "#email_subscription_state_id > optgroup:nth-child(1) > option:nth-child(1)"
  element :register, "#signup-btn"



  def signup_with(name,email,password,confirm_password,mobile,state)
    self.name.set "#{name}"
    self.email.set "#{ email }"
    self.password.set "#{ password }"
    self.confirm_password.set "#{confirm_password}"
    self.mobile.set "#{mobile}"
    self.state.set "#{state}"
    self.register.set "#{register}"
  end
end
