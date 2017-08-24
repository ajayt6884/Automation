require 'page-object'

class ProductProperty
  include PageObject
  include AdminMenu
  include AdminAction
  include ListingAction
  PageObject.javascript_framework = :jquery

  page_url 'http://rnd.domain4now.com/admin/properties'
  text_field(:property_name, :id => 'property_name')
  text_field(:property_presentation, :id => 'property_presentation')

  def new_product_property(name = random_string(5), presentation = random_string(5))
    self.property_name = name
    self.property_presentation = presentation
  end

end