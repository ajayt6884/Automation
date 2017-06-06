Feature: Checkout

 Background:
  Given i am on the home page
  And signin
  And add the item to the cart

Scenario: Checkout and Order place
    When I click on the proceed button
    Then add the shipping address and again click on the proceed button
    Then I click on the pay button
    And order is complete successfully
