class ShoppingCart
  include PageObject
  PageObject.javascript_framework = :jquery

  button(:empty,:value => 'Empty Cart')
  button(:continue_shopping,:text => 'Continue shopping')
  button(:update,:id => 'update-button')    # to update cart after entering coupon code
  button(:checkout,:id => 'checkout-link')




end