Feature: Add To Cart

 Background:
  Given i am on home page
  And I select a category city & travel from the top

Scenario: Add an Item
    When I select an deal from the city & travel page
    Then I should redirect to deal detail page
    When I add the deal to my cart
    Then I should see the deal in my cart
    Then I click on continue shopping button
    And see the deal detail page again
    Then click on Fashion category
    And agian select the deal from page
    Then i should redirect to deal detail page
    When i click on buy button
    Then deal is added to my cart and i m able to see it
