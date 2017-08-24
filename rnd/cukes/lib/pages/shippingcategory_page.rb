require 'page-object'
class ShippingCategory
  include PageObject
  include AdminMenu
  include AdminAction
  include ListingAction

  PageObject.javascript_framework = :jquery

  page_url('http://rnd.domain4now.com/admin/shipping_categories')

  text_field(:shipping_category_name,:id => 'shipping_category_name')


  def shipping_category(name = random_string(10))
    self.shipping_category_name = name
  end

end