And /^search the user "(.*?)"$/ do | email |
     on(AdminUsers).search(email)
end

And /^specify the details amount "(.*?)", "(.*?)", "(.*?)" and submit the form$/ do |amt, mode, reason |
   on(StoreCredit).details(amt, mode, reason)
   on(StoreCredit).submit
end

And /^submit the blank credit_debit form$/ do
  on(StoreCredit).submit
end

And /^click the "(.*?)" button for user "(.*?)"$/ do  |action, user|
  on(AdminUsers).action(action, user)
end

=begin
Then(/^I should get a success message on store credit page "(.*?)"/) do  |message|
   on(StoreCredit).verify_success_message.should include message
end
=end