
Then /^Lorem the response should be (\d+)$/ do |code|
	Spree::Response.code.should be code.to_i
	puts Spree::Response.headers.to_s
    puts Spree::Response.request.to_s
    puts Spree::Response.response.to_s
    data = JSON.parse(Spree::Response.body)
    puts "COUNT:" +" #{data['count']}"
    puts "TOTAL COUNT:" +"#{data['total_count']}"
    puts "CURRENT PAGE:" +"#{data['current_page']}"
    puts "PAGES:" +"#{data['pages']}"
    puts "NO. OF PRODUCTS:" +"#{data['products'].length}"
    puts "Products Listed:"
    if (data['products'].length > 0)
       for i in 0..(data['products'].length - 1) do 
         pro = data['products'][i]
         puts "PRODUCTS name: " +"#{pro['name']}"
       end
    end   
  
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
	
   # Hash of product ( variants ( option values, imgaes, description), product properties)
end	