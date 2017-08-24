Feature: As an admin able to list STOCK LOCATIONS
 @index
 Scenario: As an admin I am able to view list of Stock locations
  When I send GET request to view list of all stock location
  Then the response should be 200
  And Json response should be an hash of stock locations

  @search 
 Scenario: As an admin I am able to search Stock locations
  When I send GET request to search stock location by "name" "default"
  Then the response should be 200 
  And the stock location "name" should contain "default"

  @create @run
  Scenario: As an admin I am able to create Stock locations
  When I send POST request to create stock location with:
  | name          | action |
  | Test Location | true  |
  Then the response should be 201 
  And the stock location "name" should be "Test Location"
 #@show
  When I send GET request to view stock location
  Then the response should be 200 
  And the stock location "name" should be "Test Location"
 #@update
 When I send PUT request to update stock location with:
 | name          | action  |
 | Test Location 1 | false   |
 Then the response should be 200
 And the stock location "active" should be "false"
 #@delete
 When I send DELETE request to delete the stock location
 Then the response should be 204 
 #@show
 When I send GET request to view stock location
 Then the response should be 404 
   