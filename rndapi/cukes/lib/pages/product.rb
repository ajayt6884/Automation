class ProductAttribute

@@product_detail = ["id", "name", "description", "price", "available_on", "permalink", "meta_description", "meta_keywords", "taxon_ids", "variants", "option_types", "product_properties"]
@@variant_detail = ["id", "name", "sku", "price", "weight", "height", "width", "depth", "is_master", "cost_price", "permalink", "option_values", "images"]
@@attributes = ["id", "name", "description", "price", "available_on", "permalink", "meta_description", "meta_keywords", "taxon_ids"]
@@required_attributes = ["name", "price"]
 def get_product
   @@product_detail
 end

 def get_variant
   @@variant_detail
 end

 def get_attributes
   @@attributes
 end

 def get_required_attributes
   @@required_attributes
 end

end