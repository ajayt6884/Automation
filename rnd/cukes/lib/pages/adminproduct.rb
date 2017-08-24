module ProductImage
  include PageObject
  include AdminMenu
  include AdminAction
  PageObject.javascript_framework = :jquery

  file_field(:image, :id => 'image_attachment')
  select(:variant,:id => 'image_viewable_id')

end

module ProductVariant
  include PageObject
  include AdminMenu
  include AdminAction
  PageObject.javascript_framework = :jquery

  def add_variant(size,color)
    self.create_new_record
    #Select Size
    opt_type = @browser.find_elements(:class => 'select2-choice')
    opt_type[0].click
    opt = @browser.find_elements(:class => 'select2-input')
    opt[1].send_keys(size)
    @browser.find_element(:class => 'select2-match').click
    sleep(1)
    #Select Color
    opt_type = @browser.find_elements(:class => 'select2-choice')
    opt_type[1].click
    opt = @browser.find_elements(:class => 'select2-input')
    opt[1].send_keys(color)
    @browser.find_element(:class => 'select2-match').click
    sleep(1)
    self.create

  end

end

class AdminProducts
  include PageObject
  include AdminMenu
  include AdminAction
  include ProductImage
  include ProductVariant
  PageObject.javascript_framework = :jquery

  DEFAULT_DATA = {
      'name' => 'Slim Fit Jeans',
      'master_price' => '1000',
      'available_date' => '2013/07/09'
  }
  page_url 'http://rocksanddolls:@l3rt@lw@ys@rnd.domain4now.com/admin/products'
  text_field(:product_name,:id => 'product_name')
  text_field(:product_sku,:id => 'product_sku')
  text_field(:master_price,:id => 'product_price')
  text_field(:available_on,:id => 'product_available_on')
  checkbox(:published, :id => 'product_published_at')
  checkbox(:featured, :id => 'product_featured')
  textarea(:description, :id => 'product_description')
  text_field(:meta_keyword,:id => 'product_meta_keywords')
  text_field(:meta_description,:id => 'product_meta_description')

  link(:product_cancel,:class=>'button', :class=>'icon-remove')
  text_field(:permalink,:id =>'product_permalink')

  def product_info(data ={})
    data = DEFAULT_DATA.merge(data)
    self.product_name= data['name']
    #self.product_sku= data['sku']
    self.master_price= data['master_price']
    self.available_on= data['available_date']

  end


  def update_product
    self.description = "Lorem Ipsum Dolor Sit Amet"
  end

  def add_taxon(taxon)
    choose = @browser.find_elements(:class => 'select2-input')
    choose[2].send_keys(taxon)
    sleep(1)
    @browser.find_element(:class => 'select2-result-label').click
  end

  def add_option_type(optiontype)
    choose = @browser.find_elements(:class => 'select2-input')
    choose[3].send_keys(optiontype)
    sleep(1)
    @browser.find_element(:class => 'select2-result-label').click
  end

  def add_shipping_category(shipping_category)
    cnt = @browser.find_elements(:class => 'select2-choice')
    cnt[0].click
    sc = @browser.find_elements(:class => 'select2-input')
    sleep(1)
    sc[3].send_keys(shipping_category)
    @browser.find_element(:class => 'select2-match').click
  end

  def add_tax_category(tax_category)
    cnt = @browser.find_elements(:class => 'select2-choice')
    cnt[1].click
    sc = @browser.find_elements(:class => 'select2-input')
    sleep(1)
    sc[3].send_keys(tax_category)
    @browser.find_element(:class => 'select2-match').click
  end

  def admin_product_sidebar(section)
    @browser.find_element(:link_text => "#{section}").click
  end


end