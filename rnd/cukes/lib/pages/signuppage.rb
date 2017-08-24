require "page-object"

class SignUpPage
 include ErrorPanel 
 include PageObject
 include CommonMethods
 PageObject.javascript_framework = :jquery
 DEFAULT_DATA = {
 	'password' => '123456',
 	'confirmpassword' => '123456'
 }
  text_field(:useremail,:id=>"spree_user_email")
  text_field(:userpassword,:id=>"spree_user_password")
  text_field(:userpasswordconfirmation,:id=>"spree_user_password_confirmation")
  button(:create,:value=>"Create")
  
   
 def signup(data = {})
   data = DEFAULT_DATA.merge(data)
   email = random_string+"@mailinator.com"
   self.useremail= email
   self.userpassword= data['password']
   self.userpasswordconfirmation= data['confirmpassword']
   self.create
  end
 def signupe(data = {})
   data = DEFAULT_DATA.merge(data)
   self.useremail= "vijay@vinsol.com"
   self.userpassword= data['password']
   self.userpasswordconfirmation= data['confirmpassword']
   self.create
  end

  def signupb(data = {})
   data = DEFAULT_DATA.merge(data)
   self.userpassword= data['password']
   self.userpasswordconfirmation= '1235678'
   self.create
  end

end