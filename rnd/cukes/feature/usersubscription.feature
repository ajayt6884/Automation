Feature: As a user I should not be able to complete order if any of the information  provided is wrong.

  Background: Given I am Logged in and in Home Page
    Given I am logged in with "vijay1@mailinator.com" and password "123456"
 @fail
  Scenario: As a user I am able to subscribe for newsletter
    Then I go to My Account page
    And click edit
    Then I subscribe for newsletter
    Then I should see the success message
    And click edit
    Then subscribe to newsletter should be check

  #Scenario: As a user I am able to subscribe from footer subscription section
@fail
  Scenario: As a user I am able to unsubscribe for newsletter
    Then I go to My Account page
    And click edit
    Then I unsubscribe for newsletter
    Then I should see the success message
    And click edit
    Then subscribe to newsletter should be uncheck