@set4
Feature: As an admin, I should be able to CRUD tax category

  Background: I am logged in as admin and in configuration section
    Given I am logged in as admin
    And go to TAX CATEGORIES
    Then I should see heading "Listing Tax Categories"

  Scenario: I should be able to create a new "Tax Category" successfully after filling all the fields.
   Then I click button NEW TAX CATEGORY
   Then I should see heading "New Tax Category"
   And fill the new tax category form
   And submit the form
   Then I should get a success message "has been successfully created!"


  Scenario: I should not be able to create new tax category without name or with already used name.
   Then I created a new tax category with name " "
   Then I should see the error message "Name can't be blank"
   When I submit the new category form with reserved name
   Then I should see the error message "Name has already been taken"


  Scenario: I should not be able to create new tax category without name.
    Then I created a new tax category with name " "
    Then I should see the error message "Name can't be blank"

  Scenario: I should be able delete the tax category.
    Then I created a new tax category with name "To Delete"
    Then I click delete button of "To Delete" column "NAME" and confirm the popup
    #And the record "To Delete" should not be present
    And the record "To Delete" should not be present in listing column "NAME"

   Scenario: I should able to edit the tax category.
    Then I created a new tax category with name "Test Cat"
    Then I should get a success message "has been successfully created!"
    Then I click edit button of tax category "Test Cat" column "NAME"
    And submit the form with updated info "Test Cat2","Lorem ipsum" for tax category
    Then I should get a updated successfully message "has been successfully updated!"
    Then I click delete button of "Test Cat2" column "NAME" and confirm the popup
     And the record "Test Cat2" should not be present
    #And the record "Test Cat2" should not be present in listing column "Name"


  Scenario: I should not be able to edit the tax category name to already existing name.
    Then I created a new tax category with name "Test Cat1"
    Then I should get a success message "has been successfully created!"
    Then I created a new tax category with name "Test Cat2"
    Then I should get a success message "has been successfully created!"
    Then I click edit button of tax category "Test Cat1" column "NAME"
    And submit the form with updated info "Test Cat2","Lorem ipsum" for tax category
    Then I should see the error message "Name has already been taken"
    Then I go back to list
    Then I click delete button of "Test Cat1" column "NAME" and confirm the popup
    And the record "Test Cat1" should not be present
    #And the record "Test Cat1" should not be present in listing column "Name"
    Then I click delete button of "Test Cat2" column "NAME" and confirm the popup
    And the record "Test Cat2" should not be present
    #And the record "Test Cat2" should not be present in listing column "Name"


  Scenario: I should not be able to edit the tax category name to blank.
    Then I created a new tax category with name "Test Cat3"
    Then I should get a success message "has been successfully created!"
    Then I click edit button of tax category "Test Cat3" column "NAME"
    And submit the form with updated info " ","Lorem ipsum" for tax category
    Then I should see the error message "Name can't be blank"

  #Scenario to edit default checkbox
