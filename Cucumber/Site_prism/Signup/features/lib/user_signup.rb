class Signup < SitePrism::Page

  element :name, "html body.touch-disabled div.ui-dialog.ui-widget.ui-widget-content.ui-corner-all.register-splash-screen.new-member.hideTitle.ui-draggable div#new_member_register.ui-dialog-content.ui-widget-content div#signup_popup_form ul.signup-box-splash form#new_user.new_user li dl.signup-header dd.form-group input#user_firstname.form-input.validate"
  element :email, "html body.touch-disabled div.ui-dialog.ui-widget.ui-widget-content.ui-corner-all.register-splash-screen.new-member.hideTitle.ui-draggable div#new_member_register.ui-dialog-content.ui-widget-content div#signup_popup_form ul.signup-box-splash form#new_user.new_user li dl.signup-header dd.form-group input#user_email.form-input.validate"
  element :password, "html body.touch-disabled div.ui-dialog.ui-widget.ui-widget-content.ui-corner-all.register-splash-screen.new-member.hideTitle.ui-draggable div#new_member_register.ui-dialog-content.ui-widget-content div#signup_popup_form ul.signup-box-splash form#new_user.new_user li dl.signup-header dd.form-group input#user_password.form-input.validate"
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
