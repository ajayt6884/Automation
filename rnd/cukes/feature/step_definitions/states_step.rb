And /^go to STATES$/ do
  visit(StatePage)
end

Then(/^I select "(.*?)" from country list$/) do | country |
 on(StatePage).click_country
 on(StatePage).select_country(country)
end

Then(/^I click button NEW STATE$/) do
  on(StatePage).create_new_record
end

Then(/^fill the name and abbreviation of state$/) do
  on(StatePage).new_state
end

And(/^fill the name "(.*?)" and abbreviation "(.*?)" of state$/) do |arg1, arg2 |
  on(StatePage).new_state(arg1, arg2)
end

Then(/^I click delete button of state "(.*?)" column "(.*?)" and confirm the popup$/) do |name, column|
  message = on(StatePage).confirm(true) do
    on(StatePage).delete_record(name,column)
  end
  message.should include "Are you sure?"

end

Then /^I click edit button of state "(.*?)" column "(.*?)"$/  do |name,column|
  on(StatePage).edit_record(name, column)
end
