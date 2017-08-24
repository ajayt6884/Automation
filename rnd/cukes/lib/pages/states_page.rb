require 'page-object'

class StatePage
  include PageObject
  include AdminMenu
  include AdminAction
  include ListingAction

  PageObject.javascript_framework = :jquery

  page_url('http://rnd.domain4now.com/admin/countries/49/states')

  button(:click_country,:class => 'select2-choice')
  text_field(:search_country,:class => 'select2-input')
  unordered_list(:country_list,:class => 'select2-result')

  text_field(:state_name,:id => 'state_name')
  text_field(:state_abbreviation,:id => 'state_abbr')


  def select_country(country)
    self.search_country = country
    @browser.find_element(:class => 'select2-match').click

  end

  def new_state(name = random_string(10), abbr = random_string(3) )
    self.state_name = name
    self.state_abbreviation = abbr
  end


end