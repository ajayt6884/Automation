module Taxonomy
  
#Methods to deal with country
  def taxonomylist(options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/taxonomies?#{@token}", options) #?per_page=3&page=9
  end

  def taxonomynew(data = {}, options={})
    options.merge!({:basic_auth => @auth})
    self.class.post("/taxonomies?taxonomy[name]=#{data['name']}&#{@token}", options)
  end
  
  def taxonomysearch(data = {}, options = {})
    options.merge!({:basic_auth => @auth})
    search_param = "q[" + data['param'] + "_cont]=" + data['value']
    self.class.get("/taxonomies?#{search_param}&#{@token}", options)
  end

  def taxonomydetail(data = {}, options = {})
     options.merge!({:basic_auth => @auth})
    self.class.get("/taxonomies/#{data['id']}?#{@token}", options)
  end

  def taxonomyupdate(data = {}, options = {})
  	 options.merge!({:basic_auth => @auth})
    self.class.put("/taxonomies/#{data['id']}?taxonomy[#{data['param']}]=#{data['value']}&#{@token}", options)

  end

  def taxonomydelete(data = {}, options = {})
     options.merge!({:basic_auth => @auth})
     self.class.delete("/taxonomies/#{data['id']}?#{@token}", options)
  end

  def taxonlist(data = {}, options = {})
       options.merge!({:basic_auth => @auth})
    self.class.get("/taxonomies/#{data['taxonomy_id']}/taxons?#{@token}", options) 
  end

  def taxonnew(data = {}, options = {})
    options.merge!({:basic_auth => @auth})
    name = URI::encode("#{data['taxon_name']}")
    self.class.post("/taxonomies/#{data['taxonomy_id']}/taxons?taxon[name]=#{name}&#{@token}", options)

  end

  def taxonupdate(data = {}, options = {})
  	 options.merge!({:basic_auth => @auth})
  	 value = URI::encode("#{data['value']}")
    self.class.put("/taxonomies/#{data['taxonomy_id']}/taxons/#{data['taxon_id']}?taxon[#{data['param']}]=#{value}&#{@token}", options)

  end

  def taxondelete(data = {}, options = {})
      options.merge!({:basic_auth => @auth})
     self.class.delete("/taxonomies/#{data['taxonomy_id']}/taxons/#{data['taxon_id']}?#{@token}", options)
  end
end
