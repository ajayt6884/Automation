require 'page-object'

class LoginPage
 include PageObject
 PageObject.javascript_framework = :jquery

 page_url "http://rocksanddolls:@l3rt@lw@ys@rnd.domain4now.com/"

 link(:signup,:href=>'/signup')
 div(:error,:class=>'flash')
 text_field(:email,:id => 'spree_user_email')
 text_field(:password,:id => 'spree_user_password')
 button(:login,:value => 'Login')
 
 def signin(data)
  self.email = data['email']
  self.password = data['password']
  self.login
 end

 def error_messages
  self.error
 end
end