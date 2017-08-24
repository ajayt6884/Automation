module Country 
#Methods to deal with country
  def countrylist(options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/countries.json?per_page=300&#{@token}", options) #?per_page=3&page=9
    #HTTParty::Response = 
  end

  def countrysearch(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    search_param = "q[" + data['param'] + "_cont]=" + data['value']
    self.class.get("/countries.json?per_page=300&#{search_param}&#{@token}", options)
  end

  def countryshow(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/countries/#{data['id']}?per_page=300&#{@token}", options)
  end

  def nacountrylist(options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/countries.json?per_page=300&#{@usertoken}", options) #?per_page=3&page=9
    #HTTParty::Response = 
  end

  def nacountrysearch(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    search_param = "q[" + data['param'] + "_cont]=" + data['value']
    self.class.get("/countries.json?per_page=300&#{search_param}&#{@usertoken}", options)
  end

  def nacountryshow(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/countries/#{data['id']}?per_page=300&#{@usertoken}", options)
  end
end