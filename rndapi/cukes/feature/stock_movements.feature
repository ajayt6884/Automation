Feature: As an admin able to CRUD stock movements
@index
Scenario: Able to list stock movements of a stock location
When I Send GET request to view list of stock movements for stock location "named" "india"
Then the response should be 200
And JSON response should have hash of stock movements

Scenario: Able to list specific stock movement
When I Send GET request to view stock movements for "variant_id" "63" by stock location "named" "india"
Then the response should be 200
And JSON response should have hash of stock movements attributes


@create @update  @update-fail
Scenario: Able to create a stock movement
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

 When I Send POST request to create stock movements with:
 |loc_name|quantity|action    |
 | india  | 10     | recieved |
 Then the response should be 201
 And JSON response should have hash of stock movements attributes
  #@serach   #by stock movement id
 When I send GET request to search stock movements by "id"
 Then the response should be 200
 And JSON response should have hash of stock movements

  #@update
  When I send UPDATE request to update quantity of stock movements
  Then the response should be 201
  And JSON response should have hash of stock movements attributes

 @delete @run @delete-fail
 Scenario: As an admin I am able to delete stock movement
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

  When I Send POST request to create stock movements with:
  |loc_name|quantity|action    |
  | india  | 10     | recieved |
  Then the response should be 201
  And JSON response should have hash of stock movements attributes
  
  #@delete
  When I send DELETE request to delete stock movement
  Then the response should be 204
 