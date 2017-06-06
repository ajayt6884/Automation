Feature: Home page

Background:
Given i am on product listing page 

Scenario: Successful Edit Existiing Product
When i click on product
Then i should redirect to product detail page
When i update the name of the product
Then i will see the message product updated successfully
