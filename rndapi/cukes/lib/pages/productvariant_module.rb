module ProductVariant
#Methods to deal with product variants 

 def createsku
   (0...2).map{65.+(rand(25)).chr}.join + Time.new.to_i.to_s
 end
 def productvariantslist(data = {}, options = {})
    options.merge!({:basic_auth => @auth})
    self.class.get("/products/#{data['product_perma']}/variants.json?token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9", options) 
 end

 def productvariantshow(data = {}, options = {})
      options.merge!({:basic_auth => @auth})
    self.class.get("/products/#{data['product_perma']}/variants/#{data['variant_id']}?token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9", options) 
 end

 def productvariantnew(data = {}, options={})
 	options.merge!({:basic_auth => @auth})
    self.class.get("/products/#{data['product_perma']}/variants/new?#{@token}", options)
 end

 def productvariantcreate(data = {}, options={})
     options.merge!({:basic_auth => @auth})
     
     if data.has_key?('option_value_ids')
        self.class.post("/products/#{data['product_perma']}/variants/?variant[height]=#{data['height']}&variant[width]=#{data['width']}&variant[depth]=#{data['depth']}&variant[option_value_ids][]=#{data['option_value_ids'][0]['option1']}&variant[option_value_ids][]=#{data['option_value_ids'][0]['option2']}&variant[sku]=#{self.createsku}&variant[price]=#{data['variant_price']}&#{@token}", options)
     else
        self.class.post("/products/#{data['product_perma']}/variants/?variant[height]=#{data['height']}&variant[width]=#{data['width']}&variant[depth]=#{data['depth']}&variant[sku]=#{self.createsku}&variant[price]=#{data['variant_price']}&#{@token}", options)
     end   
 end

 def productvariantupdate(data = {}, options={})
 	 options.merge!({:basic_auth => @auth})
     self.class.put("/products/#{data['product_perma']}/variants/#{data['variant_id']}?variant[height]=#{data['variant_attr']['height']}&variant[width]=#{data['variant_attr']['width']}&variant[depth]=#{data['variant_attr']['depth']}&#{@token}", options)
 end

 def productvariantdelete(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.delete("/products/#{data['product_perma']}/variants/#{data['variant_id']}?#{@token}", options)
 end
end

