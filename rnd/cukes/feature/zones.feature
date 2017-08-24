@set3
Feature: As an admin I am able to CRUD zones

  Background: I am logged in as admin and in configuration section
    Given I am logged in as admin
    And go to ZONES
    Then I should see heading "Zones"


 Scenario: I am able to create a new zone without selecting country/state
   Then I click button NEW ZONE
   Then I should see heading "New Zone"
   And fill the new zone form
   And submit the form
   Then I should get a success message "has been successfully created!"


 Scenario: I should not be able to create a zone without name or using reserved name
    Then I created a new zone with name " "
    Then I should see the error message "Name can't be blank"
    When I submit the new zone form with reserved name
    Then I should see the error message "Name has already been taken"


 Scenario: I am able to delete the zone not associated to any tax rates and shipping method
    Then I created a new zone with name "To Delete"
    Then I click delete button of "To Delete" column "NAME" and confirm the popup
    And the record "To Delete" should not be present


 Scenario: I am able to create a new zone with selecting country
     Then I click button NEW ZONE
     Then I should see heading "New Zone"
     And fill the new zone form with "Test Zone1"
     And select the option country_based
     Then button Add Country should be visible
     And I add the country "India"
     And I add the country "Pakistan"
     And submit the form
     Then I should get a success message "has been successfully created!"
@fail
  Scenario: I should not be able create a new zone with reserved country
    Then I click button NEW ZONE
    Then I should see heading "New Zone"
    And fill the new zone form with "Test Zone2"
    And select the option country_based
    Then button Add Country should be visible
    And I add the country "Poland"
    And I add the country "Pakistan"
    And submit the form
    Then I should see the error message "Highlighted countries are already selected"
@fail
  Scenario:  I should not be able edit a zone with reserved country
    Then I click edit button of zone "To Test Reserved Country" column "NAME"
    Then button Add Country should be visible
    And I add the country "Poland"
    Then click update
    Then I should see the error message "Highlighted countries are already selected"

  Scenario: I am able to create a new zone with selecting state
    Then I click button NEW ZONE
    Then I should see heading "New Zone"
    And fill the new zone form with "Test Zone2"
    And select the option state_based
    Then button Add State should be visible
    And I add the state "Virginia"
    And I add the state "Alabama"
    And submit the form
    Then I should get a success message "has been successfully created!"
@fail
  Scenario: I should not be able to create a zone with selecting reserved state
    Then I click button NEW ZONE
    Then I should see heading "New Zone"
    And fill the new zone form with "Test Zone2"
    And select the option state_based
    Then button Add State should be visible
    And I add the state "Arizone"
    And I add the state "California"
    And submit the form
    Then I should see the error message "Highlighted states are already selected"
@fail
  Scenario:  I should not be able edit a zone with reserved state
    Then I click edit button of zone "To Test Reserved State" column "NAME"
    Then button Add State should be visible
    And I add the state "Arizona"
    And I add the state "California"
    Then click update
    Then I should see the error message "Highlighted states are already selected"

