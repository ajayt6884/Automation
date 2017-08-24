Feature: As an admin able to list of orders
  
  Scenario: Able to list orders
  When I send GET request for orders list
  Then the response should be 200
  And the JSON response should be an array with orders



Scenario: As an admin able to search order
 When I send Get request to search order by "number" "R12"
 Then the response should be 200
 And the JSON response should contain orders list where "number" contains "R12"


Scenario: As an admin able to search order
 When I send Get request to search order by "email" "mailinator"
 Then the response should be 200
 And the JSON response should contain orders list where "email" contains "mailinator" 



Scenario: As an admin able to show details of an order
 When I send SHOW request to view order details of an order "R665706376"
 Then the response should be 200
 And the JSON response should be an array of order attributes
 And the order number should be "R665706376" 


 @create 
 Scenario: As an admin able to create new order
 When I send create request for new order
 Then the response should be 201
 And the JSON response should be an array of order attributes

 @create @run
 Scenario: As an admin able to create new order with line item
 When I send create request for new order having line item of variant "119" and quantity "2"
 Then the response should be 201
 And the JSON response should be an array of order attributes
 And the Line item should be present in it




 #@address
 #Scenario: As an admin able to add address info i an order

 #@empty 
 #Scenario: As an admin able to empty order's cart

