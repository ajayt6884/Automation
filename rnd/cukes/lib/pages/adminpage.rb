require 'page-object'

class AdminPage
 include PageObject
 include AdminMenu
 PageObject.javascript_framework = :jquery

 page_url 'http://rocksanddolls:@l3rt@lw@ys@rnd.domain4now.com/admin'
 span(:goto_last_page,:class=>'last')
  
  
 def goto_last
   goto_last_page_element.click
 end



end



class AdminUsers
 include PageObject
 include AdminMenu
 include AdminAction
 include ListingAction

 PageObject.javascript_framework = :jquery

 page_url 'http://rocksanddolls:@l3rt@lw@ys@rnd.domain4now.com/admin/users'
 text_field(:user_email,:id => 'user_email')
 text_field(:password,:id => 'user_password')
 text_field(:confirm_password,:id => 'user_password_confirmation')
 text_field(:email_search,:id => 'q_email_cont')
 checkbox(:user_role,:id => 'user_spree_role_user')
 checkbox(:admin_role,:id => 'user_spree_role_admin')
 button(:searchbtn,:class => 'icon-search')
 link(:view_credit,:link_text => 'View')  #First link element having text "View"
 link(:credit,:link_text => 'Credit') #First link element having text "Credit"
 link(:debit,:link_text => 'Debit') #First link element having text "Debit"

 def search(email)
    self.email_search  = email
    self.searchbtn
 end

 def action(action, user)
   if action == "credit"
     self.credit
   elsif action == "debit"
     self.debit
   else
     self.view_credit
   end
 end

 def create_user(email = random_string+"@mailinator.com", pwd = '123456', conf_pwd = '123456')
   self.user_email= email
   self.password= pwd
   self.confirm_password= conf_pwd
   self.check_user_role
   self.create_record
 end

  def update_user(pwd = '123456', conf_pwd = '123456')
    self.password= pwd
    self.confirm_password= conf_pwd
    self.update
  end
end

class AdminOrders
 include PageObject
 include AdminMenu
 include AdminAction
 PageObject.javascript_framework = :jquery

 page_url 'http://rocksanddolls:@l3rt@lw@ys@rnd.domain4now.com/admin/orders'

end

class AdminReports
 include PageObject
 include AdminMenu
 include AdminAction
 PageObject.javascript_framework = :jquery

 page_url 'http://rocksanddolls:@l3rt@lw@ys@rnd.domain4now.com/admin/reports'

end

class AdminConfigurations
  include PageObject
  include AdminMenu
  include AdminAction
  PageObject.javascript_framework = :jquery

  h5(:configuration,:class=>'sidebar-title')
  unordered_list(:config_sidebar,:class=>'sidebar')

  def verify_configurationheading
    configuration_element.span_element.text
  end

  def verify_config(pos)
    self.config_sidebar_element[(pos.to_i)-1].text
  end

  def my_settings(setting)
     @browser.find_element(:link_text => "#{setting}").click
  end


end

class HomePage
  include PageObject
  include AdminMenu
  include AdminAction
  PageObject.javascript_framework = :jquery

  page_url 'http://rocksanddolls:@l3rt@lw@ys@rnd.domain4now.com'

end