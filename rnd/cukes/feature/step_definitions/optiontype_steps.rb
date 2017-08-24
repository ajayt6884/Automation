And /^go to option type$/ do
  visit(OptionType)
end

And /^specify option type details$/ do
  on(OptionType).new_option_type
end

Then /^I specify option "(.*?)" and "(.*?)"$/ do  |option, display|
  on(OptionType).new_option(option, display)
end

Then /^I add another option "(.*?)" and "(.*?)"$/ do  |option, display|
  on(OptionType).add_record
  on(OptionType).new_option(option, display)
end

Then /^I create a new option type with name "(.*?)"$/ do |name|
  on(OptionType).create_new_record
  on(OptionType).new_option_type(name)
  on(OptionType).create
end

Then /^I click edit button of option type "(.*?)" column "(.*?)"$/ do  |name, column|
  on(OptionType).edit_record(name,column)
end

And /^update the option type name to "(.*?)"$/ do |name|
  on(OptionType).update_option_type(name)
end

Then /^I click delete button of option type "(.*?)" column "(.*?)"$/ do  |name, column|
  message = on(OptionType).confirm(true) do
    on(OptionType).delete_record(name,column)
  end
  message.should include "Are you sure?"

end

Then /^(\d+) options should be created$/ do  |arg1|
  on(OptionType).option_count.should eq(arg1.to_i)
end

