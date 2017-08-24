require 'page-object'

module ErrorPanel
 include PageObject	
 div(:error_div,:id=>"errorExplanation")
  unordered_list(:error_messages) do |page|
  	page.error_div_element.unordered_list_element
   end

  def error_messages
   error_div_element.unordered_list_element.text
  end
end