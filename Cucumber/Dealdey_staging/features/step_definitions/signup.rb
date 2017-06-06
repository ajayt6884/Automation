timestamp = Time.parse(Time.now.to_s)
time = 3600* timestamp.hour + 60 * timestamp.min + timestamp.sec


Given(/^i am on user signup page$/) do
  @home = Home.new
  @home.load
  @home.popup.click
  @home.signup_button.click
end

When(/^I submit valid data in every field$/) do
  @signup = Signup.new
  @signup.signup_with('ajay',"ajay.thakur#{time}@vinsol.com",'qwerty','qwerty','09876543211','16')
  @signup.register.click
end

Then(/^i will see the popup$/) do
  @user = Signup_message.new
  @user.popup
  @user.popup_code.click
end

Then(/^i will see the success message$/) do
  @user.success_message
end

When(/^i enter the invalid data in email field$/) do
  @signup = Signup.new
  @signup.signup_with('ajay',"ajay.thakur@vinsol.com",'qwerty','qwerty','09876543211','16')
  @signup.register.click
end

Then(/^i will see the error message email already register$/) do
  @user = Signup_message.new
  @user.email_message
end

When(/^i enter the invalid data in confirm_password field$/) do
  @signup.signup_with('ajay',"ajay.thakur@vinsol.com",'qwerty','qwert','09876543211','16')
  @signup.register.click
end

Then(/^i will see the error message password does not match$/) do
  @user.password_message
end

When(/^i enter the invalid data in mobile field$/) do
  @signup.signup_with('ajay',"ajay.thakur@vinsol.com",'qwerty','qwerty','0987654321','16')
  @signup.register.click
end

Then(/^i will see the error message mobile is invalid$/) do
  @user.mobile_message
end
