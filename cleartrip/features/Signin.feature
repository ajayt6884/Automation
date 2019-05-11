Feature: Sign in with missing details
		
Scenario: Signin unsuccessfully
	Given i am on home page
  	When I click on the Yourtrips button
  	Then I click on the signin button
  	Then I click on the signin button on modal
  	Then verify the error message shown on the modal
