Given(/^i am on user signin page$/) do
  @home = Home.new
  @home.load
  @home.popup.click
  @home.signin_button.click
end

When(/^I submit valid data every field$/) do
  @signin = Signin.new
  @signin.signin_with('ajay.thakur@vinsol.com','jaythakur1')
  @signin.signin.click
end

Then(/^i will see success message$/) do
  @user = Signin_message.new
  @user.success_message
end

When(/^i submit invalid data$/) do
  @signin = Signin.new
  @signin.signin_with('ajay.thakur+1@vinsil.com','ghjgjhg')
  @signin.signin.click
end

Then(/^i will see error message$/) do
  @user = Signin_message.new
  @user.error_message
end
