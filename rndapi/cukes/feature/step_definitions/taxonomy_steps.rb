 When /^I send GET request to view list of all taxonomy$/ do
    @spree = Spree.new
	Spree::Response = @spree.taxonomylist
 end

 And /^the response should contain hash of taxonomy$/ do
   data = JSON.parse(Spree::Response.body)
   data['taxonomies'].length.should_not equal 0
   taxonomies = Array.new
   for i in 0..(data['taxonomies'].length - 1) do
     taxonomies << data['taxonomies'][i]['name']
   end
   taxonomies.include?('Categories').should be_true
   taxonomies.include?('Brand').should be_true
end


When /^I send SEARCH request for a taxonomy by "(.*?)" "(.*?)"$/ do |param, value|
    @spree = Spree.new
	Spree::Response = @spree.taxonomysearch('param' => param, "value" => value)
end

And /^the response should contain hash of attributes of taxonomy "(.*?)" "(.*?)"$/ do |param, value|
    data = JSON.parse(Spree::Response.body)
    data['taxonomies'].length.should eql 1
    for i in 0..(data['taxonomies'].length - 1) do 
    	data['taxonomies'][i]["#{param}"].should include value
    end
end

When /^I send GET request to view list of taxonomy having id "(.*?)"$/ do |id|
    @spree = Spree.new
	Spree::Response = @spree.taxonomydetail('id' => id)
end

And /^the response should contain hash of details of taxonomy having id "(.*?)"$/ do |id|
    data = JSON.parse(Spree::Response.body)
    data['name'].should eql "Categories"
    data['id'].should eql id.to_i
end

When /^I send POST request to update taxonomy having id "(.*?)" "(.*?)" to "(.*?)"/ do |id, param, value|
	@spree = Spree.new
	Spree::Response = @spree.taxonomyupdate('id' => id, 'param' => param, 'value' => value)
end

And /^the response should contain taxonomy having id "(.*?)" with updated "(.*?)" "(.*?)"$/ do |id, param, value|
    data = JSON.parse(Spree::Response.body)
    data['id'].should eql id.to_i
    data[param].should eql value
end

 When /^I send POST request to create a new taxonomy with name "(.*?)"$/ do |name|
    @spree = Spree.new
	Spree::Response = @spree.taxonomynew('name' => name)
	data = JSON.parse(Spree::Response.body)
	@spree.settaxonomy_id(data['id'])
 end

 And /^the response should contain taxonomy having "(.*?)" "(.*?)"$/ do |param, value|
    data = JSON.parse(Spree::Response.body)
	data["#{param}"].should eql value
 end

 When /^I send DELETE request for taxonomy "(.*?)" "(.*?)"$/ do |param, value|
    Spree::Response = @spree.taxonomylist
    data = JSON.parse(Spree::Response.body)
    id = 0
    for i in 0..(data['taxonomies'].length - 1) do
      if data['taxonomies'][i]["#{param}"] == value
      	id = data['taxonomies'][i]['id']
      end
    end
    Spree::Response = @spree.taxonomydelete('id' => id)
 end

 When /^I send POST request to create a new taxon with name "(.*?)"$/ do |name|
    Spree::Response = @spree.taxonnew('taxonomy_id' => @spree.gettaxonomy_id, 'taxon_name' => name)
	data = JSON.parse(Spree::Response.body)
	@spree.settaxon_id(data['id'])
 end
 
 And /^the response should contain taxon having "(.*?)" "(.*?)"$/ do |param, value|
    data = JSON.parse(Spree::Response.body)
    data['name'].should eql value
 end 

 When /^I send UPDATE request to update taxon "(.*?)" to "(.*?)"$/ do |param, value|
     Spree::Response = @spree.taxonupdate('taxonomy_id' => @spree.gettaxonomy_id,'taxon_id' => @spree.gettaxon_id, 'param' => param,'value' => value)
     data = JSON.parse(Spree::Response.body)
 end

 When /^I send DELETE request for taxon "(.*?)" "(.*?)"$/ do |param, value|
    Spree::Response = @spree.taxonlist('taxonomy_id' =>  @spree.gettaxonomy_id)
    data = JSON.parse(Spree::Response.body)
    id = 0
    for i in 0..(data.length - 1) do
      if data[i]["#{param}"] == value
      	id = data[i]['id']
      end
    end
    Spree::Response = @spree.taxondelete('taxonomy_id' =>  @spree.gettaxonomy_id,'taxon_id' => id)
 end