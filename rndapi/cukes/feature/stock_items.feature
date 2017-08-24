#Issue in create and delete
Feature: To view and CRUD stock items
 @index
 Scenario: As an admin able to view stock items listing
  When I send GET request to view stock item listing for stock location "name" "india"
  Then the response should be 200
  And Json response should be an hash of stock items

  @search 
 Scenario: As an admin able to search stock item in stock location
  When I send GET request to search stock item by "variant_id" "10" for stock location "name" "india"
  Then the response should be 200
  And Json response should be an hash of stock items having "variant_id" "10"

  #@create: Stock items will create automatically for available stock locations whenever a variant creates

 @show @delete
 Scenario: As an admin able to show, delete stock item
 When I send POST request to create new product with:
 | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
 | New Headphones | 100  |             |              |                  |              |           |

 Then the response should be 201
 #Option values ids 55(Jeans Size as option1) and 52(Jeans Color as option2)
 Then I send the CREATE request to create variant of a product with option values
 | option1 | option2 |
 | 55      | 52      |
 Then the response should be 201
 And the json response should contain hash of varaint
 | option1 | option2 |
 | 55      | 52      |
       #@show
 When I send GET request to view stock item for variant for stock location "name" "india"
 Then the response should be 200
 And Json response should contain stock items
       #@delete
 When I send DELETE request to delete stock item
 Then the response should be 204
 When I send GET request to view stock item
 Then the response should be 404

