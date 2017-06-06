Given(/^i am on Api page$/) do
  @home = Api.new
  @home.load
  sleep(5)
end


When(/^I send a POST request to api$/) do
  @signin = Api_signin.new
  @signin.method
  @signin.signin_with('staging.pushmoney.net/api/signin',' {"device_id" : "12345678901234","email" : "ajay@mailinator.com","password" : "1234567"}')
  @signin.send_button.click
end

Then(/^the response status should be 200$/) do
  @user = User.new
  @user.api_status
end
