#===STEPS FOR ORDERS
When /^I send GET request for orders list$/ do
    @spree = Spree.new
	Spree::Response = @spree.orderslist()
end

And /^the JSON response should be an array with orders$/ do
    data =  JSON.parse(Spree::Response.body)
    data['orders'].empty?.should be_false
    order_attributes = data['orders'][0].keys
    (order_attributes - @spree.ordersattributes).empty?.should be_true
   
end

When /^I send Get request to search order by "(.*?)" "(.*?)"$/ do |param, keyword|
  @spree = Spree.new
  Spree::Response = @spree.orderssearch("param" => param, "value" => keyword)
end

And /^the JSON response should contain orders list where "(.*?)" contains "(.*?)"$/ do |param,keyword|
    data =  JSON.parse(Spree::Response.body)
    data['orders'].empty?.should be_false
    for i in 0..(data['orders'].length - 1 ) do
      data['orders'][i]["#{param}"].should include keyword
    end
end


When /^I send SHOW request to view order details of an order "(.*?)"$/ do |order_number|
   @spree = Spree.new
  Spree::Response = @spree.orderdetail('order_number' => order_number)

end

And /^the order number should be "(.*?)"$/ do | order_number |
  data =  JSON.parse(Spree::Response.body)
    data['number'].should eql order_number

end
And /^the JSON response should be an array of order attributes$/ do
    data =  JSON.parse(Spree::Response.body)
    (data.keys - @spree.orderdetailattributes).empty?.should be_true
end

When /^I send create request for new order$/ do
  @spree = Spree.new
  Spree::Response = @spree.ordernew
  data =  JSON.parse(Spree::Response.body)
  @spree.setordernumber(data['number'])
end

When /^I send create request for new order having line item of variant "(.*?)" and quantity "(.*?)"$/ do |variant_id,quantity|
  @spree = Spree.new
  Spree::Response = @spree.ordernewwithli('variant_id' => variant_id, 'quantity' => quantity)
  data =  JSON.parse(Spree::Response.body)
  @spree.setordernumber(data['number'])
  
end

And /^the Line item should be present in it$/ do
   data =  JSON.parse(Spree::Response.body)
   puts data
   puts data['token']
   data['line_items'].length.should_not eql 0
end

#===STEPS FOR PAYMENT===
When /^I send GET request to view payment of an order "(.*?)"$/ do | order |
   spree = Spree.new
   Spree::Response = spree.paymentlist(order)
end	


#===STEPS FOR RETURN AUTHORIZATION

When /^I send GET request to view return authorization of "(.*?)"$/ do | order |
    spree = Spree.new
	Spree::Response = spree.return_authorization_list(order)
end
