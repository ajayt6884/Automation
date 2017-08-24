When /^I send POST request to create a line item using variant id "(.*?)" and qty "(.*?)"$/ do |variant_id, qty|
	 Spree::Response = @spree.lineitemnew('order_number' => @spree.getordernumber, 'variant_id' => variant_id,'qty' => qty )
 end

And /^the JSON response should be an array of line item attributes$/ do
  data =  JSON.parse(Spree::Response.body)
  @spree.setlineitem_id(data['id'])
  (data.keys - @spree.lineitemsattributes).empty?.should be_true
end

And /^the variant id in line item should be "(.*?)" and qty should be "(.*?)"$/ do |variant_id, qty|
  data =  JSON.parse(Spree::Response.body)
  data['variant_id'].should eql variant_id.to_i
  data['quantity'].should eql qty.to_i
end

When /^I send POST request to update the line item quantity to "(.*?)"$/ do |qty|
   Spree::Response = @spree.lineitemupdate('order_number' => @spree.getordernumber, 'lineitem_id' => @spree.getlineitem_id ,'qty' => qty )
end

And /^the quantity in line item should be should be "(.*?)"$/ do |qty|
   data =  JSON.parse(Spree::Response.body)
   data['quantity'].should eql qty.to_i
end

When /^I send DELETE request to delete the line item$/ do
   Spree::Response = @spree.lineitemdelete('order_number' => @spree.getordernumber, 'lineitem_id' => @spree.getlineitem_id)
end

