@demo @set2
Feature: As an admin I am able to CRUD product

  Background: I am logged in as admin and in configuration section
   Given I am logged in as admin
   And go to Products
 
 Scenario: I am able to create a new product without variant.
  Then I click button NEW PRODUCT
  And I fill the new product form and submit it
  Then I should get a success message "has been successfully created!"
  And fill the other info for product without option type
  And click update
  Then I should get a updated successfully message "has been successfully updated!"
  And I click button Back to product list
  Then I should see heading "Listing Products"

 
  Scenario: I am able to create a product with variant
    Then I create a new product "Slim Fit Jeans"
    And fill the other info with the taxon "Jeans"
    #Using option type "Color (Jeans Color)" and "Size (shirt size)"
    Then I go to "VARIANTS"
    And add variants
    Then I go to "IMAGES"
    And add product image
    Then I should get a success message "Image has been successfully created!"
    Then I go to "PRODUCT DETAILS"
    And publish the product
    And click update
    Then I should get a updated successfully message "has been successfully updated!"
