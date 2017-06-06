Given(/^i am on signin page$/) do
  @home = Home.new
  @home.load
end

When(/^i submit valid data in every field$/) do
  @signin = Signin.new
  @signin.signin_with('ajay.thakur+10@vinsol.com','123456')
  @signin.signin.click
end

Then(/^i will see the  success message$/) do
  @user = User.new
  @user.message
end

When(/^i submit in valid data$/) do
	@signin = Signin.new
  @signin.signin_with('ajay.thakur+10@vinsl.com','1234567')
  @signin.signin.click
end

Then(/^i will see the error message Invalid email or password$/) do
	@user1 = User.new
  @user1.error_message
end

