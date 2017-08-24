#Spree.class_eval do
module Address

  def addressshow(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/addresses/#{data['address_id']}?#{@token}", options) 
  end
  

  def addressupdate(data = {}, options={})
      options.merge!({:basic_auth => @auth})
      address_fields = data['address_fields'][0]
      query = getquery(address_fields, 1)
      self.class.put("/addresses/#{data['address_fields'][0]['id']}?#{query}&#{@token}", options) 
  end
  
  def na_addressshow(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/addresses/#{data['address_id']}?#{@usertoken}", options) 
  end
end
