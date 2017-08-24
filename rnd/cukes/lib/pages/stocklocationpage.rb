require 'page-object'

class StockLocation
  include PageObject
  include AdminMenu
  include AdminAction
  include ListingAction
  PageObject.javascript_framework = :jquery

  DEFAULT_DATA = {
      'street_address1' => '123 test st.',
      'street_address2' => 'Lorem ipsum',
      'city' => 'New Town City' ,
      'zip' =>  '1100110',
      'phone' => '08091199119' ,

  }
  page_url('http://rnd.domain4now.com/admin/stock_locations')

  button(:stock_transfer,:text => 'NEW STOCK TRANSFER')
  text_field(:stock_location_name,:id => 'stock_location_name')
  text_field(:street_address1,:id => 'stock_location_address1')
  text_field(:street_address2,:id => 'stock_location_address2')
  text_field(:city,:id => 'stock_location_city')
  text_field(:zip,:id => 'stock_location_zipcode')
  text_field(:phone,:id => 'stock_location_phone')
  checkbox(:stock_active,:id => 'stock_location_active')


  def select_countryy(country)
  count = @browser.find_elements(:class => 'select2-choice')
  count[0].click
  text = @browser.find_elements(:class => 'select2-input')
  text[1].send_keys(country)
  sleep(1)
  @browser.find_element(:class => 'select2-match').click
  end

  def select_statee(state)
    sleep(5)
    count = @browser.find_elements(:class => 'select2-choice')
    count[1].click
    sleep(5)
    text = @browser.find_element(:xpath => '/html/body/div[7]/div/input').send_keys(state)
   # text[1]
    @browser.find_element(:class => 'select2-match').click

  end

  def new_stock_location(name = random_string(5), data = {})
    data = DEFAULT_DATA.merge(data)
    self.stock_location_name = name
   # self.check_stock_active
    self.street_address1 = data['street_address1']
    self.street_address2 = data['street_address2']
    self.city = data['city']
    self.zip = data['zip']
    self.phone = data['phone']

    self.select_countryy('India')
    self.select_statee('Delhi')
  end
=begin
  def  mark_status(status)
    if status == "INACTIVE"
     self.uncheck_stock_active
    else
      self.check_stock_active
    end

  end
=end
end




