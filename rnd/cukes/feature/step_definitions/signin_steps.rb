And /^I Signin with:$/ do | table|
 on(LoginPage).signin(table.hashes.first)
end

Then /^I should get error "(.*?)"$/ do | result |
  on(LoginPage).error_messages.should include result
end