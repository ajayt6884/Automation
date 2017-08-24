@set1 @run
Feature: Able to view product listing

 Background:
   Given I am logged in as admin

 Scenario Outline: Able to view listing page of products,users, promotions, orders and static pages.
  And I click section "<section>"
  Then I should see heading "<heading>"
  And I should see NEW button
  And I should see button text "<button_text>"

   Examples:
   | section    | heading           | button_text      |
   | PRODUCTS   | Listing Products  | NEW PRODUCT      |
   | USERS      | Listing Users     | NEW USER         |
   | PROMOTIONS | Promotions        | NEW PROMOTION    |
   | ORDERS     | Listing Orders    | NEW ORDER        |
   | PAGES      | Static pages      | NEW PAGE         |


 #Scenario: Able to view products sub-tab listing page
 #  And go to Products
#   And I click section "<section>"
 #  Then I should see heading "<heading>"
 #  And I should see NEW button
  # And I should see button text "<button_text>"
  # Examples:
 # | section            | heading                      | button_text      |
 # | OPTION TYPES       | Option Types                 | NEW OPTION TYPE  |
 # | PROPERTIES         | Properties                   | NEW PROPERTY     |
 # | PROTOTYPES         | Prototypes                   | NEW PROTOTYPE    |
 # | FAVOURITE PRODUCTS | Listing Favorite Products    |                  |

 # And I click section "<section>"
 #  Then I should see heading "<heading>"
 #  And I should see NEW button
 #  And I should see button text "<button_text>"
 
 #Scenario: Able to view report listing page
 # And goto Reports
 # Then I should see heading "Listing Reports"


 #Scenario: Able to view promotion listing page
 # And goto Promotions
 # Then I should see heading "Promotions"
 # And I should see button NEW PROMOTION
#  And I should see button text "NEW PROMOTION"

#Scenario: Able to view order listing page
# And goto Orders
# Then I should see heading "Listing Orders"
# And I should see button NEW ORDER
# And I should see button text "NEW ORDER"
