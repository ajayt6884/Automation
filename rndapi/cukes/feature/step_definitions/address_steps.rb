
When /^I send GET request to view address details of an address id "(.*?)"$/ do | id |
  @spree = Spree.new
  Spree::Response = @spree.addressshow("address_id" => id)
end

When /^I send UPDATE request to an address for following fields with:$/ do |table|
   @spree = Spree.new
  Spree::Response = @spree.addressupdate("address_fields" => [table.hashes.first])
end

And /^the response should contain hash of address with:$/ do |table|
   data = JSON.parse(Spree::Response.body)
  table.hashes.first.each { |k,v|  data.has_key?k.should be_true  
   	(data[k].to_s == v).should be_true  }
end

When /^non admin user send GET request to view address details of an address id "(.*?)"$/ do |id|
  @spree = Spree.new
  Spree::Response = @spree.na_addressshow("address_id" => id)
end

And /^the response should contain text "(.*?)"$/ do |keyword|
    data = JSON.parse(Spree::Response.body)
    data['error'].should include keyword
end