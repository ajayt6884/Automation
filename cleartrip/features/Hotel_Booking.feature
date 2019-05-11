Feature: Hotel booking for One Night
		
Scenario: Book hotel for one night
	Given i am on hotel booking page
  	When I entered keyword in the where field
  	Then I select the checkin date
  	Then I select the checkout date
  	Then click on search button
