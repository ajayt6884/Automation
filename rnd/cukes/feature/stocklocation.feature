@set4
Feature:  As an admin I am able to CRUD stock location

  Background: I am logged in as admin and in configuration section
    Given I am logged in as admin
    And go to STOCK LOCATION
    Then I should see heading "Stock Locations"


 Scenario: Should be able to create new inactive stock location by specifying name.
  Then I click button NEW STOCK LOCATION
  Then I should see heading "New Stock Location"
  Then I fill stock location name "Test Stock Location1"
  And mark it inactive
  And submit the stock location form
  Then I should get a success message "has been successfully created!"
  And for stock location "Test Stock Location1" in column "NAME" I should see "INACTIVE" in column "STATE"


 Scenario: Should be able to create new stock locations with all info
   Then I click button NEW STOCK LOCATION
   Then I should see heading "New Stock Location"
   Then I fill the stock location form
   And submit the stock location form
   Then I should get a success message "has been successfully created!"
   And for stock location "Test Stock Location1" in column "NAME" I should see "ACTIVE" in column "STATE"
 
 Scenario: Should be able to make Stock Location inactive.
   Then I create a new stock location with name "Test Location2"
   Then I click edit button of stock location "Test Location2" column "NAME"
   And mark it inactive
   And update the stock location form
   Then for stock location "Test Location2" in column "NAME" I should see "INACTIVE" in column "STATE"


 Scenario: Should be able to delete stock location.
   Then I create a new stock location with name "To Delete"
   Then the record "To Delete" should be present
   And I delete the stock location "NAME" "To Delete"
   Then the stock location record "To Delete" should not be present