And /^go to STOCK LOCATION$/ do
  visit(StockLocation)
end
Then /^I click button NEW STOCK LOCATION$/ do
  on(StockLocation).create_new_record
end

Then /^I fill stock location name "(.*?)"$/ do | name |
  on(StockLocation).stock_location_name =  name
end

Then /^I create a new stock location with name "(.*?)"$/ do  | name |
  on(StockLocation).create_new_record
  on(StockLocation).new_stock_location(name)
  on(StockLocation).create
end

And /^mark it inactive$/ do
  on(StockLocation).uncheck_stock_active
end

And /^mark it active$/ do
  on(StockLocation).check_stock_active
end

Then /^I click edit button of stock location "(.*?)" column "(.*?)"$/ do  |name, column|
  on(StockLocation).edit_record(name, column)
end

And /^update the stock location form$/ do
  on(StockLocation).update
end
And /^submit the stock location form$/ do
  on(StockLocation).create
end

Then /^I fill the stock location form$/ do
  on(StockLocation).new_stock_location
end

And /^for stock location "(.*?)" in column "(.*?)" I should see "(.*?)" in column "(.*?)"$/ do |name, column1, value,column2 |
  on(StockLocation).search_value_of_column(name, column1, column2).should include value
end

Then /^the record "(.*?)" should be present$/ do | name |
  on(StockLocation).flash_message_element.when_not_visible(timeout=7) do
    on(StockLocation).text.should include name
  end
end

And /^I delete the stock location "(.*?)" "(.*?)"$/ do | column, name |
  message = on(StockLocation).confirm(true) do
    on(StockLocation).delete_record(name, column )
  end
  message.should include "Are you sure?"
end


And /^the stock location record "(.*?)" should not be present$/ do | record |
  on(StockLocation).flash_message_element.when_not_visible(timeout=7) do
    on(StockLocation).text.should_not include record
  end
end

