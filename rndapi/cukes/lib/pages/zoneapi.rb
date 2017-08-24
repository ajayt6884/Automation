module Zone
  
  #Methods to deal with country
  def zone_param(zone)
    param = {
        "zone" => {
        "name" => "#{zone['name']}",
        "zone_members" => [
                 {
                    "zoneable_type" => "#{zone['zoneable_type']}",
                    "zoneable_id" => "#{zone['zoneable_id']}"
                   }
                ]
            }
      }
      #puts Spree::HashConversions.to_params(param)
  end
  def zonelist(options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/zones.json?#{@token}", options) #?per_page=3&page=9
  end

  def zone_search(data = {}, options = {})
     options.merge!({:basic_auth => @auth})
     query= "q[" + data['key'] + "_cont]=" + data['value'].to_s
     query = URI::encode(query)
    self.class.get("/zones.json?#{query}&#{@token}", options)
  end

  def zone_show(data = {}, options = {})
    options.merge!({:basic_auth => @auth})
    self.class.get("/zones/#{data.values[0]}.json?#{@token}", options) 
  end

  def zone_new(data = {}, options = {})
    options.merge!({:basic_auth => @auth})
    self.class.post("/zones?#{@token}", options) 
  end
 
  def zone_delete(data = {}, options = {})
     options.merge!({:basic_auth => @auth})
     self.class.delete("/zones/#{data.values[0]}.json?#{@token}", options) 
  end

  
end

