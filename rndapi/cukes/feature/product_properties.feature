Feature: As an admin able to list product properties
 @index @run
 Scenario: Able to retrieve a blank list of product properties for a new product
  When I send POST request to create new product with:
  | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
  | Headphones | 100  |             |              |                  |              |           |
  
  When I send GET request for product properties of above created product with permalink
  Then the response should be 200
  And the JSON response should contain an array with hash of empty product properties

@create @index @run
Scenario: Able to retrieve a list of product properties for a new product
  When I send POST request to create new product with:
  | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
  | Slim Fit Jeans | 100  |             |              |                  |              |           |
  
  When I send GET request for product properties of above created product with permalink
  Then the response should be 200
  When I send CREATE request for product property "Size" having value "10" of product
  Then the response should be 201
  And the JSON response should contain a hash of product property



@search @run
Scenario: To search for a particular product property
 When I send POST request to create new product with:
  | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
  | Slim Fit Jeans | 100  |             |              |                  |              |           |
 When I send GET request for product properties of above created product with permalink
 Then the response should be 200
 When I send CREATE request for product property "Size" having value "10" of product
 Then the response should be 201
  When I send CREATE request for product property "Shirt" having value "28" of product
 Then the response should be 201
 When I search for product property "size" of product
 Then the response should be 200
 And the JSON response for property search should contain an array of product property hash where property name include "size"


@show @create @run
Scenario: To get information about all product property
 When I send POST request to create new product with:
  | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
  | Slim Fit Jeans | 100  |             |              |                  |              |           |
 When I send GET request for product properties of above created product with permalink
 Then the response should be 200
 When I send CREATE request for product property "Size" having value "10" of product
 Then the response should be 201
 When I send CREATE request for product property "Shirt" having value "28" of product
 Then the response should be 201
 When I send SHOW request for product properties of product
 Then the response should be 200
 And the JSON response should include "size" in hashes of product property
 And the JSON response should include "Shirt" in hashes of product property
 


 @show @update
Scenario:To update an existing product property
 When I send POST request to create new product with:
  | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
  | Slim Fit Jeans | 100  |             |              |                  |              |           |
 When I send GET request for product properties of above created product with permalink
 Then the response should be 200
 When I send CREATE request for product property "Size" having value "10" of product
 Then the response should be 201
 #When I send SHOW request for product property "Size" of product
 #Then the response should be 200
 #Then the product property "Size" have value "10"
 When I send UPDATE request for product property "Size" to "20"
 Then the response should be 200
 And the product property "Size" have updated value "20"



@delete 
Scenario: To delete a product property
When I send POST request to create new product with:
  | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
  | Slim Fit Jeans | 100  |             |              |                  |              |           |
 When I send GET request for product properties of above created product with permalink
 Then the response should be 200
 When I send CREATE request for product property "Size" having value "10" of product
 Then the response should be 201
 When I send SHOW request for product property "Size" of product
 Then the response should be 200
 And the JSON response should include hash of property "size"
 When I send DELETE request for product property "Size" of product
 Then the response should be 204
 When I send SHOW request for product property "Size" of product
 Then the response should be 200
 And the hash should be blank


  






















 
 
 
 
 
 
 
 
 