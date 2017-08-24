module StockApi
  
#Methods to deal with stock location
  def stock_location_list(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/stock_locations?#{@token}", options) #?per_page=3&page=9
  end

  def store_locations_attributes()
      @stock_location
  end

 def stock_location_search(data = {}, options={})
     options.merge!({:basic_auth => @auth})
     query= "q[" + data['param'] + "_cont]=" + data['value']
    self.class.get("/stock_locations?#{query}&#{@token}", options)
 
 end

  def stock_location_new(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.post("/stock_locations.json?#{@token}", options)
  end

  def stock_location_show(data = {}, options={})
      options.merge!({:basic_auth => @auth})
      self.class.get("/stock_locations/#{data['id']}?#{@token}", options) 
  end

  def stock_location_update(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.put("/stock_locations/#{data['id']}?#{@token}", options)
  end

  def stock_location_delete(data = {}, options={})
      options.merge!({:basic_auth => @auth})
      self.class.delete("/stock_locations/#{data['id']}?#{@token}", options)
  end
#Methods to deal with stock item list
  def stock_items_attributes
     @stock_item
  end
  def stock_item_list(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/stock_locations/#{data['stock_location_id']}/stock_items?q[s]=id%20desc&#{@token}", options) #?per_page=3&page=9
  end
=begin
  def stock_item_new(variables, options={})
     options.merge!({:basic_auth => @auth})
    self.class.post("#{variables}.json?token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9", options)
  end
=end
 def stock_item_search(data = {}, options={})
     options.merge!({:basic_auth => @auth})
     query= "q[" + data['key'] + "_eq]=" + data['value']
    self.class.get("/stock_locations/#{data['stock_location_id']}/stock_items?#{query}&#{@token}", options)
 end

 def stock_item_show(data = {}, options={})
     options.merge!({:basic_auth => @auth})
     self.class.get("/stock_locations/#{data['stock_location_id']}/stock_items/#{data['id']}?#{@token}", options)
end

def stock_item_new(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.post("/stock_locations/#{data['stock_location_id']}/stock_items?#{@token}", options)
end

def stock_item_delete(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.delete("/stock_locations/#{data['stock_location_id']}/stock_items/#{data['id']}?#{@token}", options)
end
  
#Methods to deal with stock movement
  def store_movements_attributes()
    @stock_movement
  end

  def stock_movement_list(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/stock_locations/#{data['stock_location_id']}/stock_movements?#{@token}", options) #?per_page=3&page=9
  end
 
  def stock_movement_search(data = {}, options={})
    options.merge!({:basic_auth => @auth})
     query= "q[" + data['key'] + "_eq]=" + data['value'].to_s
     puts "/stock_locations/#{data['stock_location_id']}/stock_movements?#{query}&#{@token}"
    self.class.get("/stock_locations/#{data['stock_location_id']}/stock_movements?#{query}&#{@token}", options)
 end

  def stock_movement_new(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.post("/stock_locations/#{data['stock_location_id']}/stock_movements?#{@token}", options)
  end

  def stock_movement_update(data = {}, options={})
      options.merge!({:basic_auth => @auth})
    self.class.put("/stock_locations/#{data['stock_location_id']}/stock_movements/#{data['stock_movement_id']}?#{@token}", options)
  end
 
 def stock_movement_delete(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.delete("/stock_locations/#{data['stock_location_id']}/stock_movements/#{data['stock_movement_id']}?#{@token}", options)
 end

end