
Feature: As an admin able to create LineItem for a given order
  Scenario: Able to create line item for a new order
   When I send create request for new order
   Then the response should be 201
   When I send POST request to create a line item using variant id "119" and qty "1"
   Then the response should be 201
   And the JSON response should be an array of line item attributes
   And the variant id in line item should be "119" and qty should be "1"

 Scenario: As an admin able to update quantity of line item in order  
   When I send create request for new order
   Then the response should be 201
   When I send POST request to create a line item using variant id "119" and qty "1"
   Then the response should be 201
   And the JSON response should be an array of line item attributes
   And the variant id in line item should be "119" and qty should be "1"
   When I send POST request to update the line item quantity to "3"
   Then the response should be 200
   And the JSON response should be an array of line item attributes
   And the quantity in line item should be should be "3"

@run
 Scenario: As an admin able to delete line item in order  
   When I send create request for new order
   Then the response should be 201
   When I send POST request to create a line item using variant id "119" and qty "1"
   Then the response should be 201
   And the JSON response should be an array of line item attributes
   And the variant id in line item should be "119" and qty should be "1"
   When I send DELETE request to delete the line item
   Then the response should be 204
   And the JSON response should be empty
   
   