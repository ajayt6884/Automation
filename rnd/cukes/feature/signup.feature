@set1
Feature: As a visitor i want to signup
 
 Background:
  Given I am on RND home page
  Then I click on Login
  And I click create a new account link
  

  Scenario: As a visitor i am able to signup into RND
   And I signup
   Then I should see MY ACCOUNT


  Scenario: As a visitor i should not be able to signup into RND with incorrect password confirmation
   And I signup with incorrect password confirmation
   Then I should see the error message "Password doesn't match confirmation"
  

  Scenario: As a visitor I should not be able to signup with already exiting email
    And I signup with already exiting email
    Then I should see the error message "Email has already been taken"

  Scenario: As a visitor I should not be able to signup without email
    And I signup without email
    Then I should see the error message "Email can't be blank"
