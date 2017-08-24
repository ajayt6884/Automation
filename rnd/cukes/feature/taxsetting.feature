@set4
Feature: As an admin, I am able to set tax setting true os false
 
 Background: I am logged in as admin and in configuration section
   Given I am logged in as admin
   And go to TAX SETTINGS
   Then I should see heading "Tax Settings"
 
 Scenario: Admin able to set tax setting Shipment including VAT true.
   And Shipment including VAT is not set
   Then I check the shipment include VAT checkbox
   And click update
   When I refresh the page
   Then shipment include VAT checkbox should be checked.

  Scenario: Admin able to set tax setting  Shipment including VAT false.
    And Shipment including VAT is set
    Then I uncheck the shipment include VAT checkbox
    And click update
    When I refresh the page
    Then shipment include VAT checkbox should be unchecked.