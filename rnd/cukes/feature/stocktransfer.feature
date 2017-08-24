Feature:  As an admin I am able to transfer stock between stcok location
  Background: I am logged in as admin and in configuration section
    Given I am logged in as admin
    And go to STOCK LOCATION
    Then I should see heading "Stock Locations"
 
 Scenario: Able to transfer stock between stock locations
   Given I have stock location named "Stcok Location01"
   Given I have stock location named "Stcok Location01"
   Then I go to stock transfer
   And I click button New Stock Transfer
   Then I specify Reference
   And select "Source" and "Destination"
   Then select "Product" and "Quantity"
   And click add
   And click stock transfer
   Then I should get a success message "stock_successfully_transferred"
   And see the Source info, destination info
   And product and qty transfered


