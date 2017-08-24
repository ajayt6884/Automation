@set3
Feature: As an admin i am able to CRUD states of country.

  Background: I am logged in as admin and in configuration section
    Given I am logged in as admin
    And go to STATES
    Then I should see heading "States"

  Scenario: Able to create a new state for a country
   Then I select "Nigeria" from country list
   Then I click button NEW STATE
   And fill the name and abbreviation of state
   And submit the form
   Then I should get a success message "has been successfully created!"

 Scenario: Should not be able to create a new state without name
   Then I select "Nigeria" from country list
   Then I click button NEW STATE
   And submit the form
   Then I should see the error message "Name can't be blank"

 Scenario: Able to edit state for a country
   Then I select "Nigeria" from country list
   Then I click button NEW STATE
   And fill the name "Lagos" and abbreviation "Lag" of state
   And submit the form
   Then I click edit button of state "Lagos" column "NAME"
   And fill the name "Lagos Island1" and abbreviation "LI" of state
   And click update
   Then I should get a updated successfully message "has been successfully updated!"
   Then I click delete button of state "Lagos Island1" column "NAME" and confirm the popup
   And the record "Lagos Island1" should not be present

 Scenario: Able to edit state for a country
   Then I select "Nigeria" from country list
   Then I click button NEW STATE
   And fill the name "Lagos2" and abbreviation "Lag2" of state
   And submit the form
   Then I click edit button of state "Lagos2" column "NAME"
   And fill the name " " and abbreviation "L1" of state
   And click update
   Then I should see the error message "Name can't be blank"

 Scenario: Able to delete the state
   Then I select "Nigeria" from country list
   Then I click button NEW STATE
   And fill the name "To Delete" and abbreviation "TD" of state
   And submit the form
   Then I click delete button of state "To Delete" column "NAME" and confirm the popup
   And the record "To Delete" should not be present