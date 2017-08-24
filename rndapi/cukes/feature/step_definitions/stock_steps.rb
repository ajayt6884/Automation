 #######STOCK LOCATIONS###############
 When /^I send GET request to view list of all stock location$/ do
    @spree = Spree.new
    Spree::Response = @spree.stock_location_list()
 end
	
When /^I send GET request to search stock location by "(.*?)" "(.*?)"$/ do |param, value|
     @spree = Spree.new
    Spree::Response = @spree.stock_location_search('param' => param, 'value' => value)
end


And /^the stock location "(.*?)" should contain "(.*?)"$/ do |param, value|
  data = JSON.parse(Spree::Response.body)
  puts data
  data['stock_locations'].length.should_not eql 0
  data['stock_locations'][0]["#{param}"].should include value
end

And /^Json response should be an hash of stock locations$/ do
     data = JSON.parse(Spree::Response.body)
     data['stock_locations'].length.should_not eql 0
     (data['stock_locations'][0].keys - @spree.store_locations_attributes).empty?.should be_true
end

When /^I send POST request to create stock location with:$/ do |table|
    @spree = Spree.new
    
    Spree::Response = @spree.stock_location_new({},{:query => {"stock_location" =>  { "name" => "#{table.hashes.first['name']}","active" => "#{table.hashes.first['action']}"}}})
    data = JSON.parse(Spree::Response.body)
    @spree.set_stock_location_id(data['id'])
end
 
And /^the stock location "(.*?)" should be "(.*?)"$/ do |key, value|
    data = JSON.parse(Spree::Response.body)
    data["#{key}"].to_s.should eql value

end

When /^I send GET request to view stock location$/ do
    Spree::Response = @spree.stock_location_show('id' => @spree.get_stock_location_id)
end

When /^I send PUT request to update stock location with:$/ do |table|
    Spree::Response = @spree.stock_location_update({'id' => @spree.get_stock_location_id },{:query => {"stock_location" =>  { "name" => "#{table.hashes.first['name']}","active" => "#{table.hashes.first['action']}"}}})
   
end

When /^I send DELETE request to delete the stock location$/ do
     Spree::Response = @spree.stock_location_delete('id' => @spree.get_stock_location_id )
end

#######STOCK ITEMS###############
When /^I send GET request to view stock item listing for stock location "(.*?)" "(.*?)"$/ do |key, value|
  @spree = Spree.new
	Spree::Response = @spree.stock_location_search('param' => key, 'value' => value)
	data = JSON.parse(Spree::Response.body)
	@spree.set_stock_location_id(data['stock_locations'][0]['id'])
	Spree::Response = @spree.stock_item_list('stock_location_id' => @spree.get_stock_location_id)
	#puts data = JSON.parse(Spree::Response.body)
end

And /^Json response should be an hash of stock items$/ do
  data = JSON.parse(Spree::Response.body)
  (data['stock_items'][0].keys - @spree.stock_items_attributes).empty?.should be_true
end

When /^I send GET request for stock movement listing "(.*?)"$/ do |path|
    @spree = Spree.new
	Spree::Response = @spree.stock_movement_list(path)
end

When /^I send GET request to search stock item by "(.*?)" "(.*?)" for stock location "(.*?)" "(.*?)"$/ do |key,value,skey,svalue|
    @spree = Spree.new
	Spree::Response = @spree.stock_location_search('param' => skey, 'value' => svalue)
	data = JSON.parse(Spree::Response.body)
	@spree.set_stock_location_id(data['stock_locations'][0]['id'])
	Spree::Response = @spree.stock_item_search('stock_location_id' => @spree.get_stock_location_id, 'key' => key, 'value' => value)
end

And /^Json response should be an hash of stock items having "(.*?)" "(.*?)"$/ do |key, value|
    data = JSON.parse(Spree::Response.body)
    data['stock_items'][0]["#{key}"].should eql value.to_i
end

When /^I send GET request to view stock item by id "(.*?)" for stock location "(.*?)" "(.*?)"$/ do |id, skey, svalue|
    @spree = Spree.new
    Spree::Response = @spree.stock_location_search('param' => skey, 'value' => svalue)
	data = JSON.parse(Spree::Response.body)
	@spree.set_stock_location_id(data['stock_locations'][0]['id'])
	Spree::Response = @spree.stock_item_show('stock_location_id' => @spree.get_stock_location_id, 'id' => id)
end

And /^Json response should contain stock items having "(.*?)" "(.*?)"$/ do |key, value|
     data = JSON.parse(Spree::Response.body)
     data["#{key}"].should eql value.to_i
end

When /^I send DELETE request to delete stock item$/ do
  Spree::Response = @spree.stock_item_delete('stock_location_id' => @spree.get_stock_location_id, 'id' => @spree.get_stock_item_id)
end

When /^I send GET request to view stock item$/ do
    Spree::Response = @spree.stock_item_show('stock_location_id' => @spree.get_stock_location_id, 'id' => @spree.get_stock_item_id)
end

When /^I send GET request to view stock item for variant for stock location "(.*?)" "(.*?)"$/ do |skey,svalue|
  Spree::Response = @spree.stock_location_search('param' => skey, 'value' => svalue)
	data = JSON.parse(Spree::Response.body)
	@spree.set_stock_location_id(data['stock_locations'][0]['id']) 
	Spree::Response = @spree.stock_item_list('stock_location_id' => @spree.get_stock_location_id)
  data = JSON.parse(Spree::Response.body)
  qaz = @spree.getvariant_id
    for i in 0..(data['stock_items'].length - 1) do
	    if data['stock_items'][i]['variant_id'].to_i == @spree.getvariant_id.to_i
       # puts "#{data['stock_items'][i]['id']}"
        @spree.set_stock_item_id("#{data['stock_items'][i]['id']}")
        break
	    end
	 end
  puts @spree.get_stock_item_id
	Spree::Response = @spree.stock_item_show('stock_location_id' => @spree.get_stock_location_id, 'id' => @spree.get_stock_item_id)
  puts data = JSON.parse(Spree::Response.body)
end	

And /^Json response should contain stock items$/ do
    data = JSON.parse(Spree::Response.body)
    data['id'].should eql @spree.get_stock_item_id.to_i

end

#######STOCK MOVEMENTS###############

When /^I Send GET request to view list of stock movements for stock location "(.*?)" "(.*?)"$/ do |key, value|
  @spree = Spree.new
  Spree::Response = @spree.stock_location_search('param' => key, 'value' => value)
  data = JSON.parse(Spree::Response.body)
  @spree.set_stock_location_id(data['stock_locations'][0]['id'])
  Spree::Response = @spree.stock_movement_list('stock_location_id' => @spree.get_stock_location_id)
end

And /^JSON response should have hash of stock movements$/ do
  data = JSON.parse(Spree::Response.body)
  data['stock_movements'].length.should_not eql 0
  (data['stock_movements'][0].keys - @spree.store_movements_attributes).empty?.should be_true
end

When /^I Send POST request to create stock movements with:$/ do |table|
  Spree::Response = @spree.stock_location_search('param' => 'name', 'value' => "#{table.hashes.first['loc_name']}")
  data = JSON.parse(Spree::Response.body)
  @spree.set_stock_location_id(data['stock_locations'][0]['id'])  
  Spree::Response = @spree.stock_movement_new({'stock_location_id' => @spree.get_stock_location_id}, {:query => {"stock_movement" => {"quantity" => "#{table.hashes.first['quantity']}","stock_item_id" => @spree.get_stock_item_id,"action" => "#{ table.hashes.first['action']}" }}})
  data = JSON.parse(Spree::Response.body)
   @spree.set_stock_movement_id(data['id'])
end

And /^JSON response should have hash of stock movements attributes$/ do
    data = JSON.parse(Spree::Response.body)
    (data.keys - @spree.store_movements_attributes).empty?.should be_true
end

When /^I send GET request to search stock movements by "(.*?)"$/ do  |key|
     Spree::Response = @spree.stock_movement_search('stock_location_id' => @spree.get_stock_location_id,'key' => "#{key}",'value' => @spree.get_stock_movement_id)   
end

When /^I send UPDATE request to update quantity of stock movements$/ do
    Spree::Response = @spree.stock_movement_update({'stock_location_id' => @spree.get_stock_location_id, 'stock_movement_id' => @spree.get_stock_movement_id},{:query => {"stock_movement"=> {"quantity"=> "30"}}})

end

When /^I send DELETE request to delete stock movement$/ do
    Spree::Response = @spree.stock_movement_delete('stock_location_id' => @spree.get_stock_location_id, 'stock_movement_id' => @spree.get_stock_movement_id)
end