@set1
Feature: As an admin I am able to view configuration

  Background: I am logged in as admin and in configuration section
    Given I am logged in as admin
    And go to "CONFIGURATION"

  Scenario: I am able to view configuration
    Then I should see sidebar heading Configuration
    And I should see config "GENERAL SETTINGS" in position 1
    And I should see config "MAIL METHOD SETTINGS" in position 2
    And I should see config "IMAGE SETTINGS" in position 3
    And I should see config "TAX CATEGORIES" in position 4
    And I should see config "TAX RATES" in position 5
    And I should see config "TAX SETTINGS" in position 6
    And I should see config "ZONES" in position 7
    And I should see config "COUNTRIES" in position 8
    And I should see config "STATES" in position 9
    And I should see config "PAYMENT METHODS" in position 10
    And I should see config "TAXONOMIES" in position 11
    And I should see config "SHIPPING METHODS" in position 12
    And I should see config "SHIPPING CATEGORIES" in position 13
    And I should see config "STOCK TRANSFERS" in position 14
    And I should see config "STOCK LOCATIONS" in position 15
    And I should see config "ANALYTICS TRACKERS" in position 16
    And I should see config "ROLES" in position 17
    And I should see config "STORE CREDITS" in position 18
    And I should see config "SOCIAL AUTHENTICATION METHODS" in position 19
    And I should see config "SPREE SLIDER" in position 20
    And I should see config "BANK" in position 21

@fail
  Scenario: I am able to view configuration Settings
    Then I should see sidebar heading Configuration
    When I click setting "MAIL METHOD SETTINGS"
    Then I should see heading "Mail Method Settings"
    When I click setting "IMAGE SETTINGS"
    Then I should see heading "Image Settings"
    When I click setting "TAX RATES"
    Then I should see heading "Tax Rates"
    When I click setting "TAX SETTINGS"
    Then I should see heading "Tax Settings"
    When I click setting "ZONES"
    Then I should see heading "Zones"
    When I click setting "COUNTRIES"
    Then I should see heading "Listing Countries"
    When I click setting "STATES"
    Then I should see heading "States"
    When I click setting "PAYMENT METHODS"
    Then I should see heading "Payment Methods"
    When I click setting "TAXONOMIES"
    Then I should see heading "Taxonomies"
    When I click setting "SHIPPING METHODS"
    Then I should see heading "Shipping Methods"
    When I click setting "SHIPPING CATEGORIES"
    Then I should see heading "Shipping Categories"
    When I click setting "STOCK TRANSFERS"
    Then I should see heading "Stock Transfers"
    When I click setting "STOCK LOCATIONS"
    Then I should see heading "Stock Locations"
    When I click setting "ANALYTICS TRACKERS"
    Then I should see heading "Analytics Trackers"
    When I click setting "ROLES"
    Then I should see heading "Listing Roles"
    When I click setting "STORE CREDITS"
    Then I should see heading "Listing Store Credits"
    When I click setting "SOCIAL AUTHENTICATION METHODS"
    Then I should see heading "Social Authentication Methods"
    When I click setting "SPREE SLIDER"
    Then I should see heading "Slides"
    When I click setting "BANK"
    Then I should see heading "Bank"