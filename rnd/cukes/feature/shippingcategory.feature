@set4
Feature:  As an admin I am able to CRUD shipping category

  Background: I am logged in as admin and in configuration section
    Given I am logged in as admin
    And go to Shipping Category
    Then I should see heading "Shipping Categories"

 Scenario: I am able to create new shipping category
   Then I click button New Shipping Category
   Then I should see heading "New Shipping Category"
   And fill the new Shipping Category form
   And submit the form
   Then I should get a success message "has been successfully created!"


 Scenario: Should not be able to create shipping category without name
   Then I created a new shipping category with name " "
   Then I should see the error message "Name can't be blank"
 
 @fail
 Scenario: Should not be able to create shipping category with reserved name
   Then I created a new shipping category with name "Test Shipping Category"
   Then I should get a success message "has been successfully created!"
   Then I created a new shipping category with name "Test Shipping Category"
   Then I should see the error message "Name has already been taken"

 Scenario: I am able to edit shipping category.
   Then I created a new shipping category with name "Test1 Shipping Category"
   Then I should get a success message "has been successfully created!"
   Then I click edit button of shipping category "Test1 Shipping Category" column "NAME"
   And fill the name of shipping category "Test2 Shipping Category"
   Then I should get a updated successfully message "has been successfully updated!"

 Scenario: I am able to delete shipping category
   Then I created a new shipping category with name "To Delete"
   Then I click delete button of "To Delete" column "NAME" and confirm the popup
   And the record "To Delete" should not be present