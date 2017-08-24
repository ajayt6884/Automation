module Product
  require 'uri'
#Methods to deal with product

  DEFAULT_DATA = { 
  'name' => "Lorem%20Ipsum",
  'price' => '100',
  'description' => "lorem%20ipsum%20dolor%20sit%20amet",
  'available_on' => "2013%2F07%2F15",
  'meta_description' => "lorem%20ipsum%20dolor%20sit",
  'meta_keyword' => "lorem",
  'taxon_ids' => '39'
 }
  def productslist(variables, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("#{variables}.json?per_page=2&page=1&#{@token}", options) #?per_page=3&page=9
    #HTTParty::Response = 
  end

  def productsearch(keyword, options={})
     options.merge!({:basic_auth => @auth})
    self.class.get("/products.json?q[name_cont]=#{keyword}&#{@token}", options) 
  end

  def productnew(data={}, options={})
    data = DEFAULT_DATA.merge(data)
    query = String.new
    for i in 0..(data.keys.length - 1) do
      if data.values[i] == "blank"

      else
      query += "product[" + data.keys[i] + "]=" + data.values[i]+"&"
      end
    end
    query = URI::encode(query)
    puts query
    options.merge!({:basic_auth => @auth})
    puts "/products.json?#{query}#{@token}"
    self.class.post("/products.json?#{query}#{@token}", options)
=begin     
     if (data['price'] == 'blank')
       self.class.post(URI.escape("/products.json?product[name]=#{data['name']}&product[description]=#{data['description']}&product[available_on]=#{data['available_on']}&product[meta_description]=#{data['meta_description']}&product[meta_keyword]=#{data['meta_keyword']}&product[taxon_ids]=#{data['taxon_ids']}&token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9"), options)
     else
       self.class.post(URI.escape("/products.json?product[name]=#{data['name']}&product[price]=#{data['price']}&product[description]=#{data['description']}&product[available_on]=#{data['available_on']}&product[meta_description]=#{data['meta_description']}&product[meta_keyword]=#{data['meta_keyword']}&product[taxon_ids]=#{data['taxon_ids']}&token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9"), options)
     end
=end
  end

  def products(path, options = {})
      options.merge!({:basic_auth => @auth})
    self.class.get("#{path}", options) 
  end

  def productpermalink(permalink, options = {})
      options.merge!({:basic_auth => @auth})
    self.class.get("/products/#{permalink}", options) 
  end

  def productid(id, options = {})
      options.merge!({:basic_auth => @auth})
    self.class.get("/products/#{id}?&#{token}", options) 
  end

  def product_update(data={}, options={})
      options.merge!({:basic_auth => @auth})
     
      query = String.new
      for i in 1..(data.keys.length - 1) do
        if data.values[i] == "blank"
        
        else
          query += "product[" + data.keys[i] + "]=" + data.values[i]+"&"
        end
    end
    query = URI::encode(query)
    
   
      self.class.put("/products/#{data['permalink']}?#{query}#{@token}", options)
    
     
  end

  def product_delete(data={}, options ={})
      options.merge!({:basic_auth => @auth})
      if (data['permalink'] == 'blank')
        self.class.delete("/products/#{data['id']}?#{@token}", options)
      else
        self.class.delete("/products/#{data['permalink']}?#{token}", options)
      end  
  end

end