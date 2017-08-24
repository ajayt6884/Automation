Then /^I click on first product on listing page$/ do
   on(UserHome).click_on_product_image
end

Then /^I add an item into cart$/ do
  on(ProductDetail).add_to_cart
end

Then /^I checkout$/ do
   on(ShoppingCart).checkout
end

And /^I fill the shipping address$/ do
  on(CheckoutAddress).billing_address
end
And /^I fill the billing address$/ do
  on(CheckoutAddress).uncheck_use_billing_addr
  on(CheckoutAddress).shipping_address
end

And /^click Save and Continue$/ do
  on(CheckoutAddress).to_next_step
end

Then /^I select shipping method "(.*?)"$/ do | sm_name |
 on(CheckoutDelivery).select_shipping_method(sm_name)
end

Then /^I select payment mode "(.*?)"$/ do | mode |
  on(CheckoutPayment).select_payment_mode(mode)

end

Then /^I fill the default shipping details and continue$/ do
   on(CheckoutAddress).billing_address   #And I fill the shipping address
  #on(CheckoutAddress).check_use_billing_addr     #And I fill the billing address
  on(CheckoutAddress).to_next_step    #And click Save and Continue
end

Then /^I select shipping method "(.*?)" and continue$/ do |sm_name|
  on(CheckoutDelivery).select_shipping_method(sm_name)          #Then I select shipping method "Nigeria"
  on(CheckoutDelivery).to_next_step                #And click Save and Continue
end

Then /^I select payment mode "(.*?)" and continue$/ do |mode|
  on(CheckoutPayment).select_payment_mode(mode)           #Then I select payment mode "pod"
  on(CheckoutPayment).to_next_step             #And click Save and Continue
end

Then /^I should get a unsuccessful message "(.*?)"$/ do |msg|
  on(CheckoutPayment).message.should include(msg)
end

Then /^I select payment mode fashion_bank and "(.*?)" and continue$/ do |mode|
  on(CheckoutPayment).select_payment_mode('fashion_bank')
  on(CheckoutPayment).select_payment_mode(mode)
  on(CheckoutPayment).to_next_step
end

And /^payment info should have payment mode "(.*?)", "(.*?)"$/ do | mode1, mode2 |
  on(CheckoutComplete).payment_modes.capitalize.should include mode1.capitalize
  on(CheckoutComplete).payment_modes.capitalize.should include mode2.capitalize
end