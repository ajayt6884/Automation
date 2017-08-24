require 'page-object'

module ProductListing
  include PageObject
  PageObject.javascript_framework = :jquery

  def click_on_product_image(pos = 1)
    cnt = @browser.find_elements(:class => 'product-image')
    cnt[pos - 1].find_element(:class => 'transition-image').click
  end

  def click_on_product_title(name)
    cnt = @browser.find_elements(:class => 'info')
    if prod = cnt.find {|product|  product.text == name }
      product.click
    else
      puts "Product Not Found by #{name}"
    end
  end

end

module UserHeader
  include PageObject
  PageObject.javascript_framework = :jquery
  div(:message,:class => 'flash')

end

class HomePage
 include PageObject
 PageObject.javascript_framework = :jquery

 page_url "http://rocksanddolls:@l3rt@lw@ys@rnd.domain4now.com/"

 link(:login,:href=>'/login')

end

class UserHome
 include PageObject
 include ProductListing
 PageObject.javascript_framework = :jquery

 link(:logout, :link_text => 'LOGOUT')
 link(:myaccount, :link_text => 'MY ACCOUNT')

 def logout
  self.logout
 end

 def verifymyaccount
  self.myaccount?
 end	
end

class UserHomePage
 include PageObject
 include ProductListing
 PageObject.javascript_framework = :jquery

 link(:logout, :link_text => 'LOGOUT')
 link(:myaccount, :link_text => 'MY ACCOUNT')

 def logout
  self.logout
 end

 def verifymyaccount
  self.myaccount?
 end  
end

class UserMyAccount
  include PageObject
  include ProductListing
  include UserHeader
  PageObject.javascript_framework = :jquery

  div(:message,:class => 'flash')
  link(:edit_account,:text => 'Edit')
  h1(:heading, :text => "Editing User")
  text_field(:email, :id => 'user_email')
  text_field(:pwd, :id => 'user_password')
  text_field(:confirm_pwd, :id => 'user_password_confirmation')
  checkbox(:subscribe, :id => 'user_subscription_attributes_active')
  button(:update_account, :value => 'Update')

  def uncheck_the_subscription
    if self.subscribe_checked? == true
       self.uncheck_subscribe
       self.update_account
       self.edit_account
    end
  end

  def check_the_subscription
    if self.subscribe_checked? == false
      self.check_subscribe
      self.update_account
      self.edit_account
    end
  end

end