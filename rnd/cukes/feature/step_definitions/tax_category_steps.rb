And /^go to TAX CATEGORIES$/   do
  visit(TaxCategoryPage)
end

Then /^I click button NEW TAX CATEGORY$/ do
  on(TaxCategoryPage).create_new_record
end

And /^fill the new tax category form$/  do
   on(TaxCategoryPage).tax_category
end

And /^fill the new tax category form with "(.*?)"$/  do | name |
  on(TaxCategoryPage).tax_category(name)
end

And /^submit the form without Name$/ do
  on(TaxCategoryPage).tax_category(" ")
  on(TaxCategoryPage).create
end

When /^I submit the new category form with reserved name$/ do
  on(TaxCategoryPage).tax_category("Food")
  on(TaxCategoryPage).create
end

And /^submit the form$/ do
  on(TaxCategoryPage).create
end

Then (/^I created a new tax category with name "(.*?)"$/) do | name |
  on(TaxCategoryPage).create_new_record
  on(TaxCategoryPage).tax_category(name)
  on(TaxCategoryPage).create
end

Then /^I click delete button of "(.*?)" column "(.*?)" and confirm the popup$/ do |name, column|
   message = on(TaxCategoryPage).confirm(true) do
     on(TaxCategoryPage).delete_record(name,column)
   end
   message.should include "Are you sure?"
end

Then /^I click edit button of tax category "(.*?)" column "(.*?)"$/ do | name, column |
 on(TaxCategoryPage).edit_record(name, column)
end

And /^submit the form with updated info "(.*?)","(.*?)" for tax category$/ do |arg1, arg2 |
  on(TaxCategoryPage).update_tax_category(arg1, arg2)
  on(TaxCategoryPage).update
end
And /^the record "(.*?)" should not be present in listing column "(.*?)"$/ do | name, column |
  on(TaxCategoryPage).search_record_by_col(name, column).should be_false
end

And /^the record "(.*?)" should not be present$/ do | record |
  on(TaxCategoryPage).flash_message_element.when_not_visible(timeout=7) do
    on(TaxCategoryPage).text.should_not include record
  end
end

Then /^I go back to list$/ do
  on(TaxCategoryPage).back_to_listing
end