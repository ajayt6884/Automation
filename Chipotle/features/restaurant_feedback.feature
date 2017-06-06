Feature: Submit Restaurant Feedback form
	
Scenario: Submit Restaurant Feedback form successfully
	Given i am on Restaurant Feedback Form page
	When I submit valid data in every field
	Then I click on the submit button
	Then the form submit successfully