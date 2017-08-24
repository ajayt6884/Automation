When /^I send the get request api_products$/ do
 on(ProductApi).getproduct.should be 200
end

Then /^I should get a response 200$/ do

end

And /^the list of published products$/ do

end