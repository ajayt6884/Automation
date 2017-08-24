require 'page-object'

class OptionType
  include PageObject
  include AdminMenu
  include AdminAction
  include ListingAction
  PageObject.javascript_framework = :jquery

  page_url 'http://rnd.domain4now.com/admin/option_types'

  text_field(:optiontype_name,:id => 'option_type_name')
  text_field(:optiontype_presentation,:id => 'option_type_presentation')
  table(:option,:class => 'sortable')
  #text_field(:optionname_name,:id => 'option_type_option_values_attributes_'+"#{x}"+'_name')
 # text_field(:optiondisplay,:id => 'option_type_option_values_attributes_'+"#{x}"+'_presentation')

  def new_option_type(name = random_string , presentation = random_string )
     self.optiontype_name = name
     self.optiontype_presentation = presentation
  end

  def new_option(option = random_string , display = random_string)
    opt = @browser.find_elements(:class => 'name')
    opt[0].find_element(:tag_name => 'input').send_keys(option)
    disp = @browser.find_elements(:class => 'presentation')
    disp[0].find_element(:tag_name => 'input').send_keys(display)

  end

   def option_count
     len = @browser.find_elements(:class => 'name')
     len.length

   end

  def update_option_type(name = random_string )
    self.optiontype_name = name
  end
end