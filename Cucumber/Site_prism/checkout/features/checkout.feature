Feature: Checkout

 Background:
  Given i am on home page
  And i am signin
  And i select a category city & travel from the top
  And i added the deal to the cart

Scenario: Checkout
  When i click on proceed button
  Then i should redirect to address page and i again click on proceed button
  Then i click on payment
  Then i see a message new order is placed successfully
