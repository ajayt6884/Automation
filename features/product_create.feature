Feature: Product create

Background:
Given i am signin and on orders page

Scenario: Create a product
When i click on product tab
Then i enter valid data in product fields
Then new product created successfully