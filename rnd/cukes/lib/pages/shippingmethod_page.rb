require 'page-object'


class ShippingMethod
  include PageObject
  include AdminMenu
  include AdminAction
  include ListingAction

  PageObject.javascript_framework = :jquery

  page_url('http://rnd.domain4now.com/admin/shipping_methods/new')
  text_field(:shipping_method_name,:id => 'shipping_method_name')
  text_field(:shipping_method_tracking_url,:id => 'shipping_method_tracking_url')
  #checkbox(:select_categories,:)
 # checkbox(:select_zones,:)

  #display

  #calculator


end