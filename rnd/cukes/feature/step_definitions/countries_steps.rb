Given(/^go to COUNTRIES$/) do
  visit(CountryPage)
end

Then(/^I should see country named "(.*?)" in column "(.*?)"$/) do | name, column |
  on(CountryPage).record_present(name, column).should be_true
end

Then(/^I click edit button of country "(.*?)" column "(.*?)"$/) do | name, column |
  on(CountryPage).edit_record(name, column)
end

Then(/^submit the form with name "(.*?)" and ISO name "(.*?)"$/) do | name, iso_name |
  on(CountryPage).country(name, iso_name)
end

Then(/^I should see country ISO named "(.*?)" in column "(.*?)"$/) do | name, column |
  on(CountryPage).search_record_by_col(name,column).should_not be_false
end

Then(/^the states required field is set true$/) do
  on(CountryPage).set_states_required_true
end

Then(/^I check the states required field$/) do
  on(CountryPage).check_states_required
end

Then(/^I uncheck the states required field$/) do
    on(CountryPage).uncheck_states_required
end

Then(/^for "(.*?)" in column "(.*?)" I should see "(.*?)" in column "(.*?)"$/) do |name, column1, value,column2 |
  on(CountryPage).search_value_of_column(name, column1, column2).should include value
end

Then(/^the states required field is set false$/) do
  on(CountryPage).set_states_required_false
end

Then(/^for "(.*?)" by column "(.*?)" I should see "(.*?)" for column "(.*?)"$/) do |name, column1, value,column2 |
  on(CountryPage).search_value_of_column(name, column1, column2).should include value
end
