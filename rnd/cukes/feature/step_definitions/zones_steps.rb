And /^go to ZONES$/ do
  visit(ZonePage)
end

Then /^I click button NEW ZONE$/ do
  on(ZonePage).create_new_record
end

And /^fill the new zone form$/ do
 on(ZonePage).zone
end

And /^fill the new zone form with "(.*?)"$/ do | name |
  on(ZonePage).zone(name)
end

Then /^I created a new zone with name "(.*?)"$/ do  | name |
  on(ZonePage).create_new_record
  on(ZonePage).zone(name)
  on(ZonePage).create
end

When /^I submit the new zone form with reserved name$/ do
  on(ZonePage).zone('To Test States')
  on(ZonePage).create
end

When /^select the option country_based$/ do
  on(ZonePage).select_country_based
end

When /^select the option state_based$/ do
  on(ZonePage).select_state_based
end

Then /^button Add Country should be visible$/ do
  on(ZonePage).add_country?.should be_true
end

Then /^button Add State should be visible$/ do
  on(ZonePage).add_state?.should be_true
end

Then /^I click edit button of zone "(.*?)" column "(.*?)"$/ do | name, column |
     on(ZonePage).edit_record(name, column)
end

And /^I add the country "(.*?)"$/ do | country |
  on(ZonePage).add_country
  on(ZonePage).select_country(country)
end

And /^I add the state "(.*?)"$/ do | state |
    on(ZonePage).add_state
    on(ZonePage).select_state(state)
end