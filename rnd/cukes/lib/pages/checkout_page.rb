require 'page-object'

module Checkout
  include PageObject
  PageObject.javascript_framework = :jquery

  div(:message,:class => 'flash')
  button(:to_next_step,:value => 'Save and Continue')
end

class CheckoutAddress
  include PageObject
  include Checkout
  PageObject.javascript_framework = :jquery

  DEFAULT_DATA = {
      'fname' => 'Vij',
      'lname' => 'Sah',
      'addr1' => '123 Test St.',
      'addr2' => '2/6',
      'city' => 'Town City',
      'country' => 'Nigeria',
      'state' => 'Lagos Ireland',
      'zip' => '110011',
      'phone' => '080000000000'
  }

  text_field(:fname,:id  => 'order_bill_address_attributes_firstname')
  text_field(:lname,:id  => 'order_bill_address_attributes_lastname')
  text_field(:addr1,:id  => 'order_bill_address_attributes_address1')
  text_field(:addr2,:id  => 'order_bill_address_attributes_address2')
  text_field(:city,:id  => 'order_bill_address_attributes_city')
  select_list(:country,:id => 'order_bill_address_attributes_country_id')
  select_list(:state,:id => 'order_bill_address_attributes_state_id')
  text_field(:zip,:id  => 'order_bill_address_attributes_zipcode')
  text_field(:phone,:id  => 'order_bill_address_attributes_phone')

  checkbox(:use_billing_addr,:id => 'order_use_billing')
  text_field(:sfname,:id  => 'order_ship_address_attributes_firstname')
  text_field(:slname,:id  => 'order_ship_address_attributes_lastname')
  text_field(:saddr1,:id  => 'order_ship_address_attributes_address1')
  text_field(:saddr2,:id  => 'order_ship_address_attributes_address2')
  text_field(:scity,:id  => 'order_ship_address_attributes_city')
  select_list(:scountry,:id => 'order_ship_address_attributes_country_id')
  select_list(:sstate,:id => 'order_ship_address_attributes_state_id')
  text_field(:szip,:id  => 'order_ship_address_attributes_zipcode')
  text_field(:sphone,:id  => 'order_ship_address_attributes_phone')


  def billing_address(data = {})
    data = DEFAULT_DATA.merge(data)
    self.fname = data['fname']
    self.lname = data['lname']
    self.addr1 = data['addr1']
    self.addr2 = data['addr2']
    self.city = data['city']
    self.country = data['country']
    self.state = data['state']
    self.zip = data['zip']
    self.phone = data['phone']

  end

  def shipping_address(data = {})
    data = DEFAULT_DATA.merge(data)
    self.sfname = data['fname']
    self.slname = data['lname']
    self.saddr1 = data['addr1']
    self.saddr2 = data['addr2']
    self.scity = data['city']
    self.scountry = data['country']
    self.sstate = data['state']
    self.szip = data['zip']
    self.sphone = data['phone']
  end

end

class CheckoutDelivery
  include PageObject
  include Checkout
  PageObject.javascript_framework = :jquery

  list_item(:shipping_method,:class => 'shipping-method')

  def select_shipping_method(name)
      sm = @browser.find_element(:class => 'rate-name', :text => "#{name}").click
  end
end

class CheckoutPayment
  include PageObject
  include Checkout
  PageObject.javascript_framework = :jquery

  element(:amt_in_fb,:input, :id => 'order_payments_attributes__payment_method_id')
  span(:order_total,:id => 'summary-order-total')
  checkbox(:fashion_bank,:id => 'order_payments_attributes__payment_method_id')
  radio_button(:credit_card,:id => 'order_payments_attributes__payment_method_id_3')
  radio_button(:check,:id => 'order_payments_attributes__payment_method_id_5')
  radio_button(:pod,:id => 'order_payments_attributes__payment_method_id_6')
  radio_button(:btd,:id => 'order_payments_attributes__payment_method_id_7')

  text_field(:coupon_code, :id => 'order_coupon_code')

  def select_payment_mode(mode)       #mode = fashion_bank, credit_card, check, pod, btd
    if mode == "fashion_bank"
      self.check_fashion_bank
    elsif mode == "credit_card"
      self.select_credit_card
    elsif mode == "check"
     self.select_check
    elsif mode == "pod"
      self.select_pod
    else
      self.select_btd
    end
  end
end


class CheckoutComplete
  include PageObject
  PageObject.javascript_framework = :jquery

  div(:payment_mode,:id=>"payment-info")
  span(:mode) do |page|
    page.payment_mode_element.span_element
  end

  def payment_modes
    payment_mode_element.span_element.text
  end
  #div(:success_msg, :class => 'flash')
end