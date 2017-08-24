Then(/^I go to admin section$/) do
  visit(AdminPage)
end

And(/^go to "(.*?)"$/) do |section|
  on(AdminPage).admin_section(section)
end

Then (/^I should see sidebar heading Configuration$/)  do
  on(AdminConfigurations).verify_configurationheading == "Configurations"
end

And (/^I should see config "(.*?)" in position (\d+)$/) do | config, pos |
  on(AdminConfigurations).verify_config(pos).should include config
end

When (/^I click setting "(.*?)"$/) do |setting|
  on(AdminConfigurations).my_settings(setting)
end