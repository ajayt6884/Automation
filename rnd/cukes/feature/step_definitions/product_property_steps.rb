And /^go to product property$/ do
    visit(ProductProperty)
end

Then /^I click button NEW$/ do
  on(ProductProperty).create_new_record
end

And /^specify product property details$/ do
  on(ProductProperty).new_product_property
end

And /^I click create button$/ do
  on(ProductProperty).create_record
end

Then /^I create a new product property with name "(.*?)"$/ do | name |
  on(ProductProperty).create_new_record
  on(ProductProperty).new_product_property(name)
  on(ProductProperty).create_record
end

Then /^I click edit button of property "(.*?)" column "(.*?)"$/ do |name, column|
  on(ProductProperty).edit_record(name,column)
end

And /^update the proeprty name to "(.*?)"$/ do | arg1 |
  on(ProductProperty).property_name = arg1
end

Then /^I should see property named "(.*?)" in column "(.*?)"$/ do  |name, column |
  on(ProductProperty).record_present(name, column).should be_true
end

Then /^I click delete button of property "(.*?)" column "(.*?)"$/ do |name, column |
  message = on(ProductProperty).confirm(true) do
    on(ProductProperty).delete_record(name,column)
  end
  message.should include "Are you sure?"
end

And /^submit the update form$/ do
  on(ProductProperty).update_record
end

And /^the property record "(.*?)" should not be present$/ do | record |
  on(ProductProperty).flash_message_element.when_not_visible(timeout=7) do
    on(ProductProperty).text.should_not include record
  end
end