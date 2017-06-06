Feature: Submit Philanthropy form
	
Scenario: Submit Philanthropy form successfully
	Given i am on Philanthropy Form page
	When i accept the term and condition check-box
	Then i can see the second step of the form
	When i enter the vlaue in every field of the form
	And click on submit button
	Then the form submitted successfully