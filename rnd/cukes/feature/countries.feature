@set3
Feature: As an admin I am able to view the country listing and can edit them.
 
 Background: I am logged in as admin and in configuration section
   Given I am logged in as admin
   And go to COUNTRIES
   Then I should see heading "Listing Countries"

 Scenario: Country named Nigeria should be listed in the countries listing
  Then I should see country named "Nigeria" in column "NAME"

 Scenario: As an admin I am able to edit the country name, ISO Name.
   Then I click edit button of country "Afghanistan" column "NAME"
   And submit the form with name "Afghan" and ISO name "AFGHAN"
   And click update
   Then I should see country named "Afghan" in column "NAME"
   Then I should see country ISO named "AFGHAN" in column "ISO NAME"
   Then I click edit button of country "Afghan" column "NAME"
   And submit the form with name "Afghanistan" and ISO name "AFGHANISTAN"
   And click update
   Then I should see country named "Afghanistan" in column "NAME"
   Then I should see country ISO named "AFGHANISTAN" in column "ISO NAME"

  
 Scenario: As an admin I can set the states required field true.
   Then I click edit button of country "Algeria" column "NAME"
   And the states required field is set false
   Then I click edit button of country "Algeria" column "NAME"
   Then I check the states required field
   And click update
   Then for "Algeria" in column "NAME" I should see "True" in column "STATES REQUIRED"

  
  Scenario: As an admin I can set the states required field false.
    Then I click edit button of country "Albania" column "NAME"
    And the states required field is set true
    Then I click edit button of country "Albania" column "NAME"
    Then I uncheck the states required field
    And click update
    Then for "Albania" in column "NAME" I should see "False" in column "STATES REQUIRED"

