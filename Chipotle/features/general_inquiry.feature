Feature: Submit General Inquiry form
	
Scenario: Submit General Inquiry form successfully
	Given i am on General Inquiry Form page
	When I submit valid data in every field of form
	And click on the submit button
	Then form submit successfully