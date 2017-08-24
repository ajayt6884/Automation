When /^I send GET request to view list of all zones$/ do
	spree = Spree.new
	Spree::Response = spree.zonelist()
end

When /^I send POST request to create zone with:$/ do |table|
	@spree = Spree.new
	zone = @spree.zone_param(table.hashes.first)
	Spree::Response = @spree.zone_new({},{:query =>  zone})
   data = JSON.parse(Spree::Response.body)
    @spree.set_zone_id(data['id'])
end

And /^response contain the hash of zone with:$/ do |table|
   data = JSON.parse(Spree::Response.body)
   data['name'].should eql table.hashes.first['name']
   data['zone_members'][0]['zoneable_type'].should eql table.hashes.first['zoneable_type']
   data['zone_members'][0]['zoneable_id'].should eql table.hashes.first['zoneable_id'].to_i
end

When /^I send GET request to view zone$/ do
	Spree::Response = @spree.zone_show('id' => "#{@spree.get_zone_id}")
end

When /^I send GET request to search zone by "(.*?)" "(.*?)"$/ do |key,value|
     Spree::Response = @spree.zone_search('key' => "#{key}", 'value' => "#{value}")
end

When /^I send GET request to search zone by id$/ do
	Spree::Response = @spree.zone_search('key' => "id", 'value' => "#{@get_zone_id}")
end

When /^I send Delete request to delete zone$/ do
	Spree::Response = @spree.zone_delete('id' => "#{@spree.get_zone_id}")
end

When /^I send UPDATE request to update zone info$/ do |table|
 	zone = @spree.zone_param(table.hashes.first)
	Spree::Response = @spree.zone_updatenew({'id' => "#{@get_zone_id}"},{:query =>  zone})
   data = JSON.parse(Spree::Response.body)
    @spree.set_zone_id(data['id'])
end
