 When /^I send GET request to view country list$/ do
    @spree = Spree.new
	Spree::Response = @spree.countrylist
 end

 And /^the response contain hash of (\d+) country$/ do | count|
     data = JSON.parse(Spree::Response.body)
     data['countries'].length.should eql count.to_i
 end

 When /^I send GET request to search country by "(.*?)" "(.*?)"$/ do |param,keyword|
   @spree = Spree.new
   Spree::Response = @spree.countrysearch("param" => param, "value" => keyword)
 end

 And /^the response contain hash of countries having "(.*?)" in their name$/ do |country|
   data = JSON.parse(Spree::Response.body)
   data['countries'].length.should_not equal 0
    for i in 0..(data['countries'].length - 1) do
       data['countries'][0]['name'].should include country
    end 
 end

 When /^I send GET request to view country having id "(.*?)"$/ do |id|
 	@spree = Spree.new
   Spree::Response = @spree.countryshow("id" => id)
 end

 And /^the response contain hash of country id "(.*?)"$/ do |id|
    data = JSON.parse(Spree::Response.body)
    data['id'].should eql id.to_i
 end

 When /^non admin user send GET request to view country list$/ do
     @spree = Spree.new
	Spree::Response = @spree.nacountrylist
 end

 When /^non admin user send GET request to search country by "(.*?)" "(.*?)"$/ do |param, keyword|
    @spree = Spree.new
   Spree::Response = @spree.nacountrysearch("param" => param, "value" => keyword)
 end



 When /^non admin user send GET request to view country having id "(.*?)"$/ do |id|
     @spree = Spree.new
   Spree::Response = @spree.nacountryshow("id" => id)
 end