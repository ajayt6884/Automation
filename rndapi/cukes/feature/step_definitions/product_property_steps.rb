When(/^I send GET request for product properties of above created product with permalink$/) do 
  Spree::Response = @spree.productpropertieslist('permalink' => "#{@spree.gettmp0}")
end

Then /^the response for product properties should be (\d+)$/ do |code|
    Spree::Response.code.should be code.to_i
    data = JSON.parse(Spree::Response.body)
end

Then(/^the JSON response should contain an array with hash of empty product properties$/) do
  data = JSON.parse(Spree::Response.body)
  data.has_key?('product_properties').should be_true
  data['product_properties'].length.should be 0

end

When /^I send CREATE request for product property "(.*?)" having value "(.*?)" of product$/ do | property, value |
	Spree::Response = @spree.productpropertynew("product_perma" => @spree.gettmp0,"property_name" => property, "property_value" => value )
end

And /^the JSON response should contain a hash of product property$/ do
  data = JSON.parse(Spree::Response.body)
  data.has_key?('property_name').should be_true
  data.has_key?('product_id').should be_true
  data.has_key?('value').should be_true
end

When /^I search for product property "(.*?)" of product$/ do |property|
   Spree::Response = @spree.propertysearch("product_perma" => @spree.gettmp0,"property_name" => property) 
end

And /^the JSON response for property search should contain an array of product property hash where property name include "(.*?)"$/ do |search_keyword|
  data = JSON.parse(Spree::Response.body)
  data.has_key?('product_properties').should be_true
  property = data['product_properties'][0]
  property.has_key?('property_name').should be_true
  "#{property['property_name']}".should include search_keyword
 end

When /^I send SHOW request for product properties of product$/ do
   Spree::Response = @spree.productpropertyshowall("product_id" => @spree.gettmp1)   
end

And /^the JSON response should include "(.*?)" in hashes of product property$/ do | property |  
  data = JSON.parse(Spree::Response.body)
  data.has_key?('product_properties').should be_true
  @properties = Array.new
  for i in 0..(data['product_properties'].length - 1) do
  prop = data['product_properties'][i]
  @properties << "#{prop['property_name']}".strip 
  end
  (@properties.include? property).should be_true
end

Then /^the product property "(.*?)" have value "(.*?)"$/ do | property_name, value |
  data = JSON.parse(Spree::Response.body)
  for i in 0..(data['product_properties'].length - 1) do
   if ("#{data['product_properties'][i]['property_name']}".strip = property_name)
    data['product_properties'][i]['property_name'].should eql value
   else
    puts "Product Property doesn't exist"
   end
  end
end

When /^I send UPDATE request for product property "(.*?)" to "(.*?)"$/ do | property_name, value |
   Spree::Response = @spree.productpropertyupdate("product_id" => @spree.gettmp1, "property_name" => property_name, "property_value" => value) 
end

And /^the product property "(.*?)" have updated value "(.*?)"$/ do |property_name, value |
   data = JSON.parse(Spree::Response.body)
   data['property_name'].downcase.should eql property_name.downcase
   data['value'].should eql value

end 

When /^I send DELETE request for product property "(.*?)" of product$/ do |property_name |
   Spree::Response = @spree.productpropertydelete("product_id" => @spree.gettmp1, "property_name" => property_name) 
end

When /^I send SHOW request for product property "(.*?)" of product$/ do | property_name |
    Spree::Response = @spree.productpropertyshowproperty("product_id" => @spree.gettmp1, "property_name" => property_name) 
end  

And /^the JSON response should include hash of property "(.*?)"$/ do | property_name |
   data = JSON.parse(Spree::Response.body)
   data['property_name'].should eql property_name
end

And /^the hash should be blank$/ do
  data = JSON.parse(Spree::Response.body)
  data.empty?.should be_true
end