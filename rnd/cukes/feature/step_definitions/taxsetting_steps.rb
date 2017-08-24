And /^go to TAX SETTINGS$/ do
  visit(TaxSetting)
end

And(/^Shipment including VAT is not set$/) do
  on(TaxSetting).set_shipment_include_VAT_false
end

Then(/^I check the shipment include VAT checkbox$/) do
  on(TaxSetting).check_shipment_include_VAT
end

When(/^I refresh the page$/) do
  on(TaxSetting).refresh
end

Then(/^shipment include VAT checkbox should be checked\.$/) do
  on(TaxSetting).shipment_include_VAT_status.should be_true
end

And(/^Shipment including VAT is set$/) do
  on(TaxSetting).set_shipment_include_VAT_true
end

Then(/^I uncheck the shipment include VAT checkbox$/) do
  on(TaxSetting).uncheck_shipment_include_VAT
end

Then(/^shipment include VAT checkbox should be unchecked\.$/) do
  on(TaxSetting).shipment_include_VAT_status.should be_false
end
