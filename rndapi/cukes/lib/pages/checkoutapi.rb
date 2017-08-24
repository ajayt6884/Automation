module Checkout

  def checkout_empty(data = {}, options={})
	 options.merge!({:basic_auth => @auth})
     self.class.post("/checkouts?#{@token}", options)
  end

  def checkout_with_lineitem(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    #query = "q[" + data['param'] + "_cont]=" + data['value']
    puts "/checkouts?line_items[0][variant_id]=#{data['variant_id']}&line_items[0][quantity]=#{data['quantity']}&#{@token}" 
    self.class.post("/checkouts?line_items[0][variant_id]=#{data['variant_id']}&line_items[0][quantity]=#{data['quantity']}&#{@token}", options)
  end
  

end
