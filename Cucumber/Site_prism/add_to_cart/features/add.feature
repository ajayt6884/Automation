Feature: Add To Cart

 Background:
  Given i am on home page
  And I select a category city & travel from the top

Scenario: Add an Item
    When I select an deal from the city & travel page
    Then I should redirect to deal detail page
    When I add the deal to my cart
    Then I should see the deal in my cart
    Then i click on continue shopping button
    Then i should redirect to deal deatil page again
    Then i click on fashion category
    Then i click on deal from fashion category
    When i add the deal to my cart
    Then i should see the deal in my cart

