Feature: As an admin I am able to CRUD shipping methods

 Background: I am logged in as admin and in configuration section
   Given I am logged in as admin

 Scenario: I am able to create a new shipping method using shipping category, zone and default calculator type
   Given I have shipping category with name "Shipping Category1"
   Given I have a new zone with name "Test Zone1"
   Then go to Shipping Methods
   Then I click button New Shipping Method
   And specify the name "Test Shipping Method1"
   And select shipping category "Shipping Category1"
   And select zone "Test Zone1"
   And specify other info
   And submit the form
   Then I should get a success message "has been successfully created!"
   And go to shipping method listing page
   Then I should see shipping method named "Shipping Method2" in column "NAME"
   Then I should see shipping method zone "Test Zone2" in column "ZONE"
   Then I should see calculator type "Flat Percent" in column "CALCULATOR"
   Then I should see Display type "Both" in column "DISPLAY"

 Scenario: I am able to update the info of shipping method info and calculator type
   Given I have shipping category with name "Shipping Category2"
   Given I have a new zone with name "Test Zone2"
   Then I created a new shipping method with name "Shipping Method2", zone "Test Zone2", shipping category "Shipping Category2"
   And go to shipping method listing page
   Then I click edit button of shipping method "Shipping Method2" column "NAME"
   And update the shipping category to "DEFAULT SHIPPING", zone to "To Test States"
   And calculator to "Flat Rate"
   And click update
   Then I should get a updated successfully message "has been successfully updated!"
   Then go to shipping method listing page
   Then I should see shipping method zone "To Test States" in column "ZONE"
   Then I should see calculator type "Flat Rate" in column "CALCULATOR"


 Scenario: I am able to delete the shipping method.
   Then go to Shipping Methods
   Then I created a new shipping method with name "To Delete"
   And go to shipping method listing page
   Then I click delete button of "To Delete" column "NAME" and confirm the popup


 #Scenario: After creating shipping method able to specify info for calculator.
 #  Then go to Shipping Methods
 #  Then I created a new shipping method with name "Shipping Method4"



