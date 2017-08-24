require 'page-object'

class TaxCategoryPage
  include PageObject
  include AdminMenu
  include AdminAction
  include ListingAction
  PageObject.javascript_framework = :jquery

  page_url('http://rnd.domain4now.com/admin/tax_categories')
  text_field(:name,:id => 'tax_category_name')
  text_field(:description,:id => 'tax_category_description')
  checkbox(:default,:id => 'tax_category_is_default')

  def tax_category(name = random_string.capitalize)
   self.name =  name
   self.description= "Lorem ipsum dolor sit amet"
   self.check_default

  end

  def update_tax_category(name, desc)
    self.name =  name
    self.description= desc
  end
end