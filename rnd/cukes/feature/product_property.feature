@set2
Feature:  As an admin I am able to CRUD property

  Background: I am logged in as admin and in configuration section
    Given I am logged in as admin
    And go to Products
    And go to product property
    Then I should see heading "Properties"
 
 Scenario:  I am able to create new property
   Then I click button NEW
   And specify product property details
   And I click create button
   Then I should get a success message "has been successfully created!"
 
 Scenario: I am not able to create new property without name and presentation
   Then I click button NEW
   And I click create button
   Then I should see the error message "Name can't be blank"
   Then I should see the error message "Presentation can't be blank"

 Scenario: I am able to edit the product property
   Then I create a new product property with name "Test Property"
   Then I click edit button of property "Test Property" column "NAME"
   And update the proeprty name to "Test Property1"
   And submit the update form
   Then I should see property named "Test Property1" in column "NAME"

 Scenario: I am able to delete property
   Then I create a new product property with name "To Delete"
   Then I should see property named "To Delete" in column "NAME"
   Then I click delete button of property "To Delete" column "NAME"
   And the property record "To Delete" should not be present


 #Scenario: I am not able to delete a property added to a product
