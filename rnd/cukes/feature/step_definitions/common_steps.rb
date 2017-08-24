Given /^I am logged in as admin$/ do
  visit(HomePage)
  on(HomePage).login
  on(LoginPage).signin('email' => email, 'password' => password)
  visit(AdminPage)
end

Then /^I should see heading "(.*?)"$/ do | heading |
 on(AdminPage).page_title.should be_eql heading 
# on(AdminPage).page_title.should be_eq title
end

And /^I should see NEW button$/ do
  on(AdminPage).verifynewrecords.should be_true
end

Then(/^I should get a success message "(.*?)"/) do  |message|
  on(AdminProducts).wait_until(3) do
    on(AdminProducts).verify_success_message.should include message
  end
end

Then(/^click update$/) do
  on(AdminProducts).update
end

Then(/^I should get a updated successfully message "(.*?)"$/) do |message|
  on(AdminProducts).verify_success_message.should include message
end

Given /^I am logged in with "(.*?)" and password "(.*?)"$/ do |email, pwd|
  visit(HomePage)
  on(HomePage).login
  on(LoginPage).signin('email' => email, 'password' => pwd )
end