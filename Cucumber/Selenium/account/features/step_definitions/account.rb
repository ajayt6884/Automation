Given(/^I try to create an account with password "([^"]*)"$/) do |arg1|
  @arg1 = /[a-z,0-9]/
end

Then(/^I should see that the password is invalid$/) do
  @password =! @arg1
end

Then(/^I should see that the password is valid$/) do
  @password == @arg1
end
