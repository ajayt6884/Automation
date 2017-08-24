require 'page-object'

class  ZonePage
 include PageObject
 include AdminMenu
 include AdminAction
 include ListingAction
 PageObject.javascript_framework = :jquery

 page_url('http://rnd.domain4now.com/admin/zones')
 text_field(:name,:id => 'zone_name')
 text_field(:description,:id => 'zone_description')
 checkbox(:default,:id => 'zone_default_tax')
 radio_button(:country_based,:id => 'country_based')
 radio_button(:state_based,:id => 'state_based')
 button(:add_country, :id => 'nested-country')
 button(:add_state, :id => 'nested-state')
 list_item(:list,:class => 'field')
 unordered_list(:states,:id => 'ul-nested-state')
 unordered_list(:country,:id => 'ul-nested-country')

  def zone(name = random_string.capitalize)
    self.name =  name
    self.description= "Lorem ipsum dolor sit amet"
    self.check_default
  end

  def select_state(loc)
    states_element.list_item_elements.last.select_list_element.send_keys("#{loc}")
    #puts states_element.list_item_elements.first.select_list_elements
    #puts states_element.list_item_elements.last.has_value?(loc)
   # puts li[1].text
  end

  def select_country(loc)
    puts country_element.list_item_elements.last.select_list_element.send_keys("#{loc}")
    #puts states_element.list_item_elements.first.select_list_elements
    #puts states_element.list_item_elements.last.has_value?(loc)
   # puts li[1].text
  end
end