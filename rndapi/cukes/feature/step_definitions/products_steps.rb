When /^I send GET request for "(.*?)"$/ do |path|
	@spree = Spree.new
	Spree::Response = @spree.productslist(path)
end

Then /^the response for product listing should be (\d+)$/ do |code|
	  Spree::Response.code.should be code.to_i
	  data = JSON.parse(Spree::Response.body)
    if (data['products'].length > 0)
       for i in 0..(data['products'].length - 1) do 
         pro = data['products'][i]
       end
    end   
=begin   
    #puts "PRODUCT DETAILS:" +"#{data['products']}"
    #puts "PRODUCTS name:" +"#{data['products']}"
    tmpp = (data['products'])
    puts "No. of Products: #{data['products'].length}"
    #puts "No. Of Products: #{data['products'].length} "
    if (data['products'].length > 0)
       for i in 0..(data['products'].length - 1) do 
          pro = data['products'][i]
          puts "Product Detail for #{i}st Product:"
          puts "PRODUCTS id: " +"#{pro['id']}"
          puts "PRODUCTS name: " +"#{pro['name']}"
          puts "PRODUCTS description: " +"#{pro['description']}"
      	  puts "PRODUCTS price: " +"#{pro['price']}"
          puts "PRODUCTS available_on: " +"#{pro['available_on']}"
          puts "PRODUCTS permalink: " +"#{pro['permalink']}"
          puts "PRODUCTS meta_description: " +"#{pro['meta_description']}"
          puts "PRODUCTS meta_keywords: " +"#{pro['meta_keywords']}"
          puts "PRODUCTS taxon_ids: " +"#{pro['taxon_ids']}"
          puts "@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@*@"
          tmpv = pro['variants']
          puts "No. of variants: #{pro['variants'].length}"
          if (pro['variants'].length > 0)
              for i in 0..(pro['variants'].length - 1) do
    	         var = pro['variants'][i]
                 puts "VARIANT INFO #{i}"
                 puts "Variant id: " + "#{var['id']}"
                 puts "Variant name: " + "#{var['name']}"
                 puts "Variant count_on_hand: " + "#{var['count_on_hand']}"
                 puts "Variant sku: " + "#{var['sku']}"
                 puts "Variant price: " + "#{var['price']}"
                 puts "Variant weight: " + "#{var['weight']}"
                 puts "Variant height: " + "#{var['height']}"
                 puts "Variant width: " + "#{var['width']}"
                 puts "Variant depth: " + "#{var['depth']}"
                 puts "Variant is_master: " + "#{var['is_master']}"
                 puts "Variant cost_price: " + "#{var['cost_price']}"
                 puts "Variant permalink: " + "#{var['permalink']}"
                 puts "Variant option_values:" + "#{var['option_values']}"
      
                 #opt = var['option_values']
                 puts "$$$$$$$$$$$$<<OPTION VALUE INFO>>$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                 if (var['option_values'].length > 0)
                     for j in 0..(var['option_values'].length - 1) do
                           puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                           opt = var['option_values'][j]
       	  	               puts "OPTION VALUE INFO #{j}"
       	                   puts "Option Value id: " + "#{opt['id']}"
       	                   puts "Option Value name: " + "#{opt['name']}"
       	                   puts "Option Value presentaion: " + "#{opt['presentaion']}"
       	                   puts "Option Value option_type_name: " + "#{opt['option_type_name']}"
       	                   puts "Option Value option_type_id: " + "#{opt['option_type_id']}"
                           puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                     end
                 else
                 	puts "No option type is exist for the variant."
                 end
                 puts "Variant images:" + "#{var['images']}"
                 puts "$$$$$$$$$$$$$$$$$<<IMAGES INFO>>$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                 if (var['images'].length > 0)
                      for j in 0..(var['images'].length - 1) do 
                          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                          img =  var['images'][j]
                          puts "Image id: " + "#{img['id']}"  
                          puts "Image position: " + "#{img['position']}"
                          puts "Image attachment_content_type: " + "#{img['attachment_content_type']}"
                          puts "Image attachment_file_name: " + "#{img['attachment_file_name']}"
                          puts "Image type: " + "#{img['type']}"
                          puts "Image attachment_updated_at: " + "#{img['attachment_updated_at']}"
                          puts "Image attachment_width: " + "#{img['attachment_width']}"
                          puts "Image attachment_height: " + "#{img['attachment_height']}"
                          puts "Image viewable_type: " + "#{img['viewable_type']}"
                          puts "Image viewable_id: " + "#{img['viewable_id']}"
                          puts "Image mini_url: " + "#{img['mini_url']}"
                          puts "Image small_url: " + "#{img['small_url']}"
                          puts "Image product_url: " + "#{img['product_url']}"
                          puts "Image large_url: " + "#{img['large_url']}"
                          puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                      end
                 else
                 	puts "Images are not present for variant."
                 end
                 puts "Variant description: " + "#{var['description']}"
              end
                 puts "======================================================"   
          else
          	puts "No. of Variant for #{pro['name']} is 0."
          end
          puts "PRODUCT Properties: " +"#{pro['product_properties']}" 
          puts "$$$$$$$$$$$$$$$$$<<Product Properties INFO>>$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"   
          if (pro['product_properties'].length > 0)
          for k in 0..(pro['product_properties'] - 1) do
      	      prop = pro['product_properties'][k]
      	      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      	      puts "Property id: " + "#{prop['id']}"	
      	      puts "Property product_id: " + "#{prop['product_id']}"
      	      puts "Property property_id: " + "#{prop['property_id']}"
      	      puts "Property value: " + "#{prop['value']}"
      	      puts "Property property_name: " + "#{prop['property_name']}"
      	      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
          end
          end   
       end
    else
        puts "Products count 0"	
    end
=end	
   # Hash of product ( variants ( option values, imgaes, description), product properties)
end	

And /^the JSON response should be an hash having an array of products$/ do
  data = JSON.parse(Spree::Response.body)
  data.has_key?('products').should be_true  #Json parsed to hash should have key "products"
  "#{data['products'].class}".should eql 'Array'  #Array Of Products
end

And /^products array should have hashes$/ do
  data = JSON.parse(Spree::Response.body)
  # "#{data['products'].length}".to_i.should be 1  #Array has only one element of type Hash
  "#{data['products'][0].class}".should eql "Hash"
end

And /^a single record of product have details$/ do
  product = ProductAttribute.new
  data = JSON.parse(Spree::Response.body)
  data['products'][0].keys.should eql product.get_product
end

And /^should have variants details$/ do
  product = ProductAttribute.new
  data = JSON.parse(Spree::Response.body)
  "#{data['products'][0]['variants'].class}".should eql "Array"
  "#{data['products'][0]['variants'][0].class}".should eql "Hash"
  data['products'][0]['variants'][0].keys.should eql product.get_variant
end

When /^I send POST request to create new product with:$/ do  | table |
  @spree = Spree.new
	Spree::Response = @spree.productnew(table.hashes.first)
  data = JSON.parse(Spree::Response.body)
  @spree.settmp0("#{data['permalink']}")
  @spree.settmp1("#{data['id']}")
  
end	

When /^I send PUT request to update product with:$/ do | table |
  @spree = Spree.new
  Spree::Response = @spree.product_update(table.hashes.first)
end

When /^I send DELETE request to delete product with:$/ do | table |
  @spree = Spree.new
  Spree::Response = @spree.product_delete(table.hashes.first)
end


And /^product name should be "(.*?)" and price (\d+)$/ do |name, price|
   data = JSON.parse(Spree::Response.body)
   "#{data['name']}".should eql name
   "#{data['price']}".to_i.should be price.to_i
   "#{data['variants'].length}".to_i.should be 1  
    var_data = data['variants'][0]
    "#{var_data['name']}".should eql name
    "#{var_data['price']}".to_i.should be price.to_i
   
end

When /^I send DELETE request to delete the newly created product by permalink$/ do
   data = JSON.parse(Spree::Response.body)
   @spree = Spree.new
   Spree::Response = @spree.product_delete('permalink' => "#{data['permalink']}")
end

When /^I send DELETE request to delete the newly created product by id$/ do
   data = JSON.parse(Spree::Response.body)
   @spree = Spree.new
   Spree::Response = @spree.product_delete('id' => "#{data['id']}", 'permalink' => "blank" )
end


When /^I send GET request for search of product having keyword "(.*?)"$/ do |keyword|
  @spree = Spree.new
  Spree::Response = @spree.productsearch(keyword)
end

And /^products name should contain keyword "(.*?)" in their name$/ do |keyword|
    data = JSON.parse(Spree::Response.body)
    #data['products'][0].keys.should eql product.get_product
    for i in 0..(data['products'].length - 1) do 
      data['products'][i]['name'].should include keyword
    end 
end

When /^I send GET request "(.*?)" to view product attributes$/ do |path|
  @spree = Spree.new
  Spree::Response = @spree.products(path) 
end

Then /^the response for product attributes listing should be (\d+)$/ do | code |
  Spree::Response.code.should be code.to_i
end

And /^the product attributes should be display$/ do
    product = ProductAttribute.new
    data = JSON.parse(Spree::Response.body)
    "#{data.class}".should eql "Hash"
    data.keys.should eql Array['attributes', 'required_attributes']
    data['attributes'].should eql product.get_attributes
end

And /^the required attribute of product also displayed$/ do
  product = ProductAttribute.new
    data = JSON.parse(Spree::Response.body)
    data['required_attributes'].should eql product.get_required_attributes
end 

When /^I send the GET request for the prodcut having permalink "(.*?)"$/ do |permalink|
 @spree = Spree.new
  Spree::Response = @spree.productpermalink(permalink)
end

Then /^the response for product details should be (\d+)$/ do |code|
  Spree::Response.code.should be code.to_i
end

And /^the product detail should contain details of product, its variants and product properties$/ do
   data = JSON.parse(Spree::Response.body)
   data['permalink'].should eql "laptop-bag-for-college"
end

When /^I send the GET request for the prodcut having id (\d+)$/ do | product_id |
  @spree = Spree.new
  Spree::Response = @spree.productid(product_id)
end