When /^I send GET request to "(.*?)"$/ do | path |
    spree = Spree.new
	Spree::Response = spree.countrylist(path)
 end
 
Then /^the response should be (\d+)$/ do | code |
    Spree::Response.code.should be code.to_i
end

And /^the JSON response should be empty$/ do
   Spree::Response.body.should be_nil
end