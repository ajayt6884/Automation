require 'page-object'

class TaxonomyPage
  include PageObject
  include AdminMenu
  include AdminAction
  include ListingAction
  PageObject.javascript_framework = :jquery

  page_url('http://rnd.domain4now.com/admin/taxonomies')

  text_field(:taxonomy_name,:id => 'taxonomy_name')
  label(:tree,:text => 'TREE')
  #element(:tree_icon,:ins,:class => 'jstree-icon')
  element(:edit,:i,:xpath => 'icon-edit')

   def right_click

     e1 = @browser.find_element(:class => 'jstree-icon')
     @browser.action.send_keys(e1, "\xEE\x80\x94")
     #self.tree_icon.send_keys("\xEE\x80\x94")
   end

   def edit_taxon
     self.edit.click
   end
end