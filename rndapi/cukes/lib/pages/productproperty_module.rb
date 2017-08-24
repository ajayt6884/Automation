module ProductProperty
#Methods to deal with product properties
 def productpropertieslist(data={}, options ={})
    options.merge!({:basic_auth => @auth})
    if (data['permalink'] == 'blank')
      self.class.get(URI.escape("/products/#{data['id']}/product_properties.json?token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9"), options)
    else
      self.class.get(URI.escape("/products/#{data['permalink']}/product_properties.json?token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9"), options)
    end  
  end


  def productpropertynew(data = {}, options={})
     options.merge!({:basic_auth => @auth})
     self.class.post(URI.escape("/products/#{data['product_perma']}/product_properties?product_property[property_name]=#{data['property_name']}&product_property[value]=#{data['property_value']}&token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9"), options)
 end

 #POST /api/products/1/product_properties?product_property[property_name]=size&product_property[value]=10
  def propertysearch(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get(URI.escape("/products/#{data['product_perma']}?q[property_name_cont]=#{data['property_name']}&#{@token}"), options)
    
  end

  def productpropertyshowall(data = {}, options={})
     options.merge!({:basic_auth => @auth})
    self.class.get(URI.escape("/products/#{data['product_id']}/product_properties?#{@token}"), options) 
#api/products/192/product_properties?token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9
  end

  def productpropertyshowproperty(data = {}, options={})
     options.merge!({:basic_auth => @auth})
    self.class.get(URI.escape("/products/#{data['product_id']}/product_properties/#{data['property_name']}?#{@token}"), options) 
  end


  def productpropertyupdate(data = {}, options={})
     options.merge!({:basic_auth => @auth})
    self.class.put(URI.escape("/products/#{data['product_id']}/product_properties/#{data['property_name']}?product_property[value]=#{data['property_value']}&#{@token}"), options) 
  end

  def productpropertydelete(data = {}, options={})
     options.merge!({:basic_auth => @auth})
    self.class.delete(URI.escape("/products/#{data['product_id']}/product_properties/#{data['property_name']}?#{@token}"), options)
  end
  
end