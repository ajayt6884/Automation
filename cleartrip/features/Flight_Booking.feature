Feature: Search flight from Bangalore to Delhi and confirm the same
		
Scenario: Search the flight and confirm the same
	Given i am on home page
  	When I entered keyword in the From field
  	Then I entered keyword in the TO field
  	Then I select the date
  	Then click on Search button
  	Then verify that the search result page contain the searchSummary keyword
