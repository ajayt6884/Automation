require 'page-object'

class CountryPage
  include PageObject
  include AdminMenu
  include AdminAction
  include ListingAction

  PageObject.javascript_framework = :jquery

  page_url('http://rnd.domain4now.com/admin/countries')

  text_field(:country_name,:id => 'country_name')
  text_field(:country_iso_name,:id => 'country_iso_name')
  checkbox(:states_required, :id=> 'country_states_required')

  def country(name, iso_name)
   self.country_name = name
    self.country_iso_name = iso_name
  end

  def set_states_required_true
    if self.states_required_checked? == false
      self.check_states_required
      self.update
    else
      self.update
    end
  end

  def set_states_required_false
    if self.states_required_checked? == true
      self.uncheck_states_required
      self.update
    else
      self.update
    end
  end

  def states_required_status
    self.states_required_checked?
  end
end