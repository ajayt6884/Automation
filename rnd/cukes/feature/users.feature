 @set2
Feature: As an admin I am able to CRUD User

  Background:
    Given I am logged in as admin
    And go to Users

  Scenario: I am able to create a new user.
    Then I click button NEW
    And I fill the new user form and submit it
    Then I should get a success message "Created Successfully"
    And I update user
    Then I should get a updated successfully message "Account updated"
    And I click button Back to user list
    Then I should see heading "Listing Users"

