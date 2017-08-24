require 'page-object'

class ProductDetail
  include PageObject
  PageObject.javascript_framework = :jquery

  button(:add_to_cart_btn,:id => 'add-to-cart-button')
  span(:price, :class => 'price')
  text_field(:qty, :class => 'title')

  def add_to_cart(quantity = 1)
    self.qty = quantity
    self.add_to_cart_btn
  end


end