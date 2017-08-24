Given /^I am on RND home page$/ do
  visit(HomePage)
end

Then /^I click on Login$/ do
  on(HomePage).login
end

And /^I click create a new account link$/ do
  on(LoginPage).signup
end

And /^I signup$/ do
  on(SignUpPage).signup
end

Then /^I should see "(.*?)"$/ do |keyword|
 #on(UserHomePage).verifymyaccount.should be_true
 @current_page.text.should include "keyword"
end

Then /^I should see MY ACCOUNT$/ do
 on(UserHomePage).verifymyaccount.should be_true
end

And /^I signup with incorrect password confirmation$/ do
  on(SignUpPage).signup('confirmpassword' => '1234567')
end

Then /^I should see the error message "(.*?)"$/ do |message|
  on(SignUpPage).error_messages.should include message
end

And /^I signup with already exiting email$/ do
 on(SignUpPage).signupe
end
=begin
Then /^I should see error Email has already been taken $/ do
  
end
=end
And /^I signup without email$/ do
 on(SignUpPage).signupb
end
=begin
Then /^I should see error "Email can't be blank" $/ do
  
end
=end