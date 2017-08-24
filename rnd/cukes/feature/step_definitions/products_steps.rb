And /^go to Products$/ do
 visit(AdminProducts)
end

Then(/^I click button NEW PRODUCT$/) do
  on(AdminProducts).create_new_record
end

Then(/^I fill the new product form and submit it$/) do
  on(AdminProducts).product_info()
  on(AdminProducts).create_record
end

And /^fill the other info for product without option type$/ do
  on(AdminProducts).update_product
  #on(AdminProducts).add_shipping_category('default shipping')
  on(AdminProducts).add_tax_category('Clothing')
  on(AdminProducts).add_taxon('BAGS')
  on(AdminProducts).update
end

Then /^I create a new product "(.*?)"$/ do |name|
  on(AdminProducts).create_new_record
  on(AdminProducts).product_info(:name => name)
  on(AdminProducts).create_record
end

And /^fill the other info with the taxon "(.*?)"$/ do |taxon|
  on(AdminProducts).update_product
  on(AdminProducts).add_taxon(taxon)
  on(AdminProducts).add_option_type('Jeans Color')
  on(AdminProducts).add_option_type('jeans size')
  on(AdminProducts).update
end

Then /^I go to "(.*?)"$/ do |section|
  on(AdminProducts).admin_product_sidebar(section)
end

And /^add variants$/ do
   on(AdminProducts).add_variant('34','Green')
   on(AdminProducts).add_variant('34','Black')
   on(AdminProducts).add_variant('32','Green')
   on(AdminProducts).add_variant('32','Black')
end

And /^publish the product$/ do
  on(AdminProducts).check_published
end

And /^add product image$/ do
  on(AdminProducts).create_new_record
  on(AdminProducts).image= 'E:\rnd\images\image1.jpg'
  on(AdminProducts).update
end
=begin
Then(/^field permalink should be prefilled$/) do
  on(AdminProducts).verifypermalink.should
end

Then(/^I fill product details$/) do
  pending # express the regexp above with the code you wish you had
end
=end

Then(/^I click button Back to product list$/) do
  on(AdminProducts).back_to_listing
end

