Feature: As an admin able to list ZONES
 
 Scenario: To get a list of zones, make this request:
  When I send GET request to view list of all zones
  Then the response should be 200

  @search
  @create
  Scenario: Able to create a zone
   When I send POST request to create zone with:
   | name     | zoneable_type | zoneable_id|
   | Test Zone| Spree::State  | 95         |
   Then the response should be 201
   And response contain the hash of zone with:
   | name     | zoneable_type | zoneable_id|
   | Test Zone| Spree::State  | 95         |
   
   When I send GET request to view zone
   Then the response should be 200
   And response contain the hash of zone with:
   | name     | zoneable_type | zoneable_id|
   | Test Zone| Spree::State  | 95         |
   
   When I send GET request to search zone by "name" "Test"
   Then the response should be 200

   When I send GET request to search zone by id 
   Then the response should be 200

   When I send Delete request to delete zone
   Then the response should be 204
   When I send GET request to view zone
   Then the response should be 404


  #@update
  #Scenario: To update a zone
  # When I send POST request to create zone with:
  # | name     | zoneable_type | zoneable_id|
  # | Test Zone| Spree::State  | 95         |
  # Then the response should be 201
  # And response contain the hash of zone with:
  # | name     | zoneable_type | zoneable_id|
  # | Test Zone| Spree::State  | 95         |

  


  
  
  
