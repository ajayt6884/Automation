Then(/^go to Users$/) do
  visit(AdminUsers)
end

Then(/^I click button NEW USER$/) do
  on(AdminUsers).create_new_record
end

Then(/^I fill the new user form and submit it$/) do
  on(AdminUsers).create_user()
end

=begin
Then(/^I should get a success message "(.*?)"$/) do  |message|
  on(AdminUsers).verify_success_message.should include message
end

Then(/^I should get a updated successfully message "(.*?)"$/) do |message|
  on(AdminUsers).verify_success_message.should include message
end
=end
And (/^I update user$/) do
  on(AdminUsers).update_user()
end
Then(/^I click button Back to user list$/) do
  on(AdminUsers).back_to_listing
end