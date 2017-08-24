Then /^I goto admin section$/ do
  visit(AdminPage)
end

And /^I click section "(.*?)"$/ do | section |
on(AdminPage).admin_section(section) 
end

Then /^goto Reports$/ do
  on(AdminPage).reports_menu
end

And /^I should see button text "(.*?)"$/ do | button_text |
 on(AdminPage).newrecordtext.should be_eql button_text 
end



