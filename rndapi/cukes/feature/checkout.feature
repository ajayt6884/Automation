Feature: checkout API to advance an existing order’s state. 
 @fail
Scenario: Able to create a new, empty order
 When I send POST request to create a new empty order
 Then the response should be 201
 And JSON response should have hash of checkout attribute

@run   @fail
 Scenario: Able to create a new order with line item in it
 When I send POST request to create a new order with lineitem having variant "119" and quantity "2"
 Then the response should be 201
 And JSON response should have order hash with lineitem having variant "119" and quantity "2"

 Scenario: Able to update an checkout order
  When I send POST request to create a new empty order
  Then the response should be 201
  
