@set2
Feature:  As an admin I am able to CRUD property

  Background: I am logged in as admin and in configuration section
    Given I am logged in as admin
    And go to Products
    And go to option type
    Then I should see heading "Option Types"

  Scenario:  I am able to create new property
    Then I click button NEW
    And specify option type details
    And I click create button
    Then I should get a success message "has been successfully created!"
    Then I specify option "opt1" and "present1"
    Then I add another option "op2" and "present2"
    Then I add another option "op3" and "present3"
    And click update
    Then 3 options should be created
    And I go back to list

  Scenario: I am not able to create new property without name and presentation
    Then I click button NEW
    And I click create button
    Then I should see the error message "Name can't be blank"
    Then I should see the error message "Presentation can't be blank"

  Scenario: I am able to edit the option type
    Then I create a new option type with name "Test Option Type1"
    Then I specify option "opt1" and "present1"
    Then I add another option "op2" and "present2"
    And click update
    And I go back to list
    Then I click edit button of option type "Test Option Type1" column "NAME"
    And update the option type name to "Test Option Type2"
    And click update
    Then I should see property named "Test Option Type2" in column "NAME"

  Scenario: I am able to delete property
    Then I create a new option type with name "To Delete"
    Then I specify option "opt1" and "present1"
    Then I add another option "op2" and "present2"
    And click update
    And I go back to list
    Then I click delete button of option type "To Delete" column "NAME"
    Then the record "To Delete" should not be present in listing column "NAME"

   #Scenario: As an admin I should not be able to delete option type added to any product

   #Scenario: I am not able to delete option of option type added to a product
