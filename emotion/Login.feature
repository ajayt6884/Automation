Feature: Automate the app
 
Background:
  Given I am on home page
 
Scenario: Login and Logout from the app
	When I click on the Login Button
  	When type the email and paasword in the field
  	Then I should be able to Login

	When I click on the any Emotion
  	When move the scroll bar up or down
  	Then tap on the next button
  	Then click on the finished 
  	Then my emotion should be recorded

	When I click on the Hamberger menu
	When click on the My Profile button
	Then click on My Account button
	Then I click on the logout button
	Then I can logout from the app successfully


