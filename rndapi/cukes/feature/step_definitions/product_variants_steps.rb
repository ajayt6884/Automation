When /^I send GET request for product variants of product permalink "(.*?)"$/ do |permalink|
  @spree = Spree.new
  Spree::Response = @spree.productvariantslist(permalink)
end

Then /^the response for product variants should be (\d+)$/ do |code|
  Spree::Response.code.should be code.to_i
    puts Spree::Response.headers.to_s
    puts Spree::Response.request.to_s
    puts Spree::Response.response.to_s
    data = JSON.parse(Spree::Response.body)
end

Then /^I send the GET request for the attributes of variant of a product$/ do
  Spree::Response = @spree.productvariantnew("product_perma" => @spree.gettmp0)
end


And /^the json response should contain attributes and required_attributes key$/ do
   data = JSON.parse(Spree::Response.body)
  data.has_key?('attributes').should be_true
  data.has_key?('required_attributes').should be_true
end

Then /^I send the CREATE request to create variant of a product with price "(.*?)"$/ do |price|
     Spree::Response = @spree.productvariantcreate("product_perma" => @spree.gettmp0, "variant_price" => price )
     data = JSON.parse(Spree::Response.body)
     @spree.setvariant_sku("#{data['sku']}")
end

Then /^I send the CREATE request to create variant of a product with option values$/ do | table |
    Spree::Response = @spree.productvariantcreate("product_perma" => @spree.gettmp0, "option_value_ids" => [table.hashes.first] )
    data = JSON.parse(Spree::Response.body)
    @spree.setvariant_id("#{data['id']}")
    
end

 And /^the json response should contain the newly created variant in hash of varaint in array$/ do
     data = JSON.parse(Spree::Response.body)
     var_ids = Array.new
    for i in 0..(data['variants'].length - 1) do
    	var_ids << data['variants'][i]['id'].to_i  #values in table's hash is in string
    end
    puts var_ids
    puts @spree.getvariant_id
    var_ids.include?@spree.getvariant_id.should be_true
    
 end


And /^the json response should contain hash of varaint$/ do |table|
	data = JSON.parse(Spree::Response.body)
    option_value_ids = Array.new
    for i in 0..1 do
    	option_value_ids << data['option_values'][i]['id'].to_s  #values in table's hash is in string
    end
    data['is_master'].should be_false
    data['permalink'].should eql @spree.gettmp0
    (option_value_ids.size == table.hashes.first.values.size).should be_true
    (option_value_ids & table.hashes.first.values == option_value_ids ).should be_true
end

When /^I send UPDATE request to variant of a product with option values$/ do | table |
    Spree::Response = @spree.productvariantupdate("product_perma" => @spree.gettmp0,"variant_id" => @spree.getvariant_id, "variant_attr" => table.hashes.first)
end

And /^the json response should contain hash of varaint attributes$/ do | table |
   data = JSON.parse(Spree::Response.body)
   table.hashes.first['height'].to_i.should eql data['height'].to_i
   table.hashes.first['width'].to_i.should be data['width'].to_i 
   table.hashes.first['depth'].to_i.should be data['depth'].to_i
end

When /^I send DELETE request to delete variant of a product$/ do
    Spree::Response = @spree.productvariantdelete("product_perma" => @spree.gettmp0,"variant_id" => @spree.getvariant_id)
end

And /^I send the request to list variants of product$/ do
    Spree::Response = @spree.productvariantslist("product_perma" => @spree.gettmp0)
end

Then /^the deleted variant should not be listed$/ do
    data = JSON.parse(Spree::Response.body)
    var_id = Array.new
    for i in 0..(data['variants'].length - 1) do
      var_id << "#{data['variants'][i]['id']}".to_i
    end
    (var_id.include?@spree.getvariant_id).should be_false
end

And /^I send SHOW request to list specific variant of product$/ do
   Spree::Response = @spree.productvariantshow("product_perma" => @spree.gettmp0, "variant_id" => @spree.getvariant_id)
end

