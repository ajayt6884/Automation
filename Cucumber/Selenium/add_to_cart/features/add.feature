Feature: Add To Cart

 Background:
  Given i am on home page
  And I select a category city & travel from the top

Scenario: Add an Item
    When I select an deal from the city & travel page
    When I add the deal to my cart
    Then I should see the deal in my cart
