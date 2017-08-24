When /^I send POST request to create a new empty order$/ do
	@spree = Spree.new
    Spree::Response = @spree.checkout_empty()
    data = JSON.parse(Spree::Response.body)
    @spree.set_checkout_order_id(data['id'])

end
 
And /^JSON response should have hash of checkout attribute$/ do
	 data = JSON.parse(Spree::Response.body)
     (data.keys - @spree.checkout_attributes).empty?.should be_true
     puts @spree.checkout_attributes - data.keys
     (@spree.checkout_attributes - data.keys).empty?.should be_true

end
When /^I send POST request to create a new order with lineitem having variant "(.*?)" and quantity "(.*?)"$/ do |variant_id, quantity|
	@spree = Spree.new
    Spree::Response = @spree.checkout_with_lineitem('variant_id' => variant_id, 'quantity' => quantity)
end

And /^JSON response should have order hash with lineitem having variant "(.*?)" and quantity "(.*?)"$/ do  |variant_id, quantity|
    data = JSON.parse(Spree::Response.body)
    puts data
    data['line_items'].length.should_not eql 0
    (data['line_items'][0]['variant_id'] == variant_id.to_i).should be_true
    (data['line_items'][0]['quantity'] == quantity.to_i).should be_true
    (data['line_items'][0]['price'].to_f * data['line_items'][0]['quantity'].to_f == data['line_items'][0]['price'].to_f).should be_true
end