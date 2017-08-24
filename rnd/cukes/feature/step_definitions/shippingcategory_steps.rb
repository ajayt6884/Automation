And /^go to Shipping Category$/ do
  visit(ShippingCategory)
end

Then /^I click button New Shipping Category$/ do
  on(ShippingCategory).create_new_record
end

And /^fill the new Shipping Category form$/ do
  on(ShippingCategory).shipping_category()
end

Then /^I created a new shipping category with name "(.*?)"$/ do  | name |
  on(ShippingCategory).create_new_record
  on(ShippingCategory).shipping_category(name)
  on(ShippingCategory).create
end

Then /^I click edit button of shipping category "(.*?)" column "(.*?)"$/ do  | name, column |
  on(ShippingCategory).edit_record(name, column)
end

And /^fill the name of shipping category "(.*?)"$/ do | name |
  on(ShippingCategory).shipping_category(name)
  on(ShippingCategory).update
end