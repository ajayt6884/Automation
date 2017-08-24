module Order
  
#Methods to deal with ORDERS
  def ordersattributes()
    @orders
  end

  def orderdetailattributes
     @orderdetails
  end

  def orderslist(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/orders.json?per_page=300&#{@token}", options) #?per_page=3&page=9
    
  end

  def ordersnew(variables, options={})
     options.merge!({:basic_auth => @auth})
    self.class.post("#{variables}", options)
  end

  def orderssearch(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    search_param = "q[" + data['param'] + "_cont]=" + data['value']
    self.class.get("/orders.json?#{search_param}&#{@token}", options)
  end

 def orderdetail(data = {}, options = {})
     options.merge!({:basic_auth => @auth})
     self.class.get("/orders/#{data['order_number']}?#{@token}", options)
 end

 def ordernew(options = {})
     options.merge!({:basic_auth => @auth})
     self.class.post("/orders?#{@token}", options)
 end

 def ordernewwithli(data = {}, options = {})
     options.merge!({:basic_auth => @auth})
     self.class.post("/orders?order[line_items][0][variant_id]=#{data['variant_id']}&order[line_items][0][quantity]=#{data['quantity']}&order['token']=@usertoken&#{@token}", options)
 end
 
  #Methods to deal with Line Item

 def lineitemnew(data = {}, options = {})
     options.merge!({:basic_auth => @auth})
     self.class.post("/orders/#{data['order_number']}/line_items?line_item[variant_id]=#{data['variant_id']}&line_item[quantity]=#{data['qty']}&#{@token}", options)
 end

 def lineitemupdate(data = {}, options = {})
     options.merge!({:basic_auth => @auth})
     self.class.put("/orders/#{data['order_number']}/line_items/#{data['lineitem_id']}?line_item[quantity]=#{data['qty']}&#{@token}", options)
 end

 def lineitemdelete(data = {}, options = {})
     options.merge!({:basic_auth => @auth})
     self.class.delete("/orders/#{data['order_number']}/line_items/#{data['lineitem_id']}?#{@token}", options)
 end
#/orders/R1234567/line_items/1
 def lineitemsattributes
     @lineitems
 end
  #Methods to deal with Payment of an order
  def paymentlist(order, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/orders/#{order}/payments.json?token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9", options) #?per_page=3&page=9
    
  end

  #Methods to deal with Shipment of an order

  #Methods to deal with Return Authorization of an order
  def return_authorization_list(order, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/orders/#{order}/return_authorizations.json?token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9", options) #?per_page=3&page=9
  end
end