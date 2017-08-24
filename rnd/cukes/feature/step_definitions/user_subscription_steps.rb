Then /^I go to My Account page$/ do
   on(UserHome).myaccount
end

And /^click edit$/ do
   on(UserMyAccount).edit_account
end

Then /^I subscribe for newsletter$/ do
  on(UserMyAccount).uncheck_the_subscription
  on(UserMyAccount).check_subscribe
  on(UserMyAccount).update_account
end

Then /^I should see the success message$/ do
  on(UserMyAccount).message.should include "Account updated"
end

Then /^subscribe to newsletter should be check$/ do
  on(UserMyAccount).subscribe_checked?.should be_true
end

Then /^I unsubscribe for newsletter$/ do
  on(UserMyAccount).check_the_subscription
  on(UserMyAccount).uncheck_subscribe
  on(UserMyAccount).update_account
end

Then /^subscribe to newsletter should be uncheck$/ do
  on(UserMyAccount).subscribe_checked?.should be_false
end