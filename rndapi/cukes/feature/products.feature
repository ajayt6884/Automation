Feature: As an admin able to list products
 
 @index
 Scenario: Able to list products
  When I send GET request for "/products"
  Then the response for product listing should be 200
  And the JSON response should be an hash having an array of products
  And products array should have hashes
  And a single record of product have details 
  And should have variants details

@new
Scenario: Able to view the attibutes of product and required field for it
  When I send GET request "/products/new" to view product attributes
  Then the response for product attributes listing should be 200
  And the product attributes should be display
  And the required attribute of product also displayed

@new1
Scenario: Able to create product on specifying name and price
 When I send POST request to create new product with:
 | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
 | New Headphones | 100  |             |              |                  |              |           |

 Then the response should be 201
 And product name should be "New Headphones" and price 100

@new1
Scenario: Not able to create product if either name or price is not present
 When I send POST request to create new product with:
 | name  | price |description | available_on | meta_description | meta_keyword | taxon_ids |
 | Headphones | blank|             |              |                  |              |           |
 Then the response should be 422
 
@new
Scenario: Not able to create product if either name or price is not present
 When I send POST request to create new product with:
 | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
 |       | 100   |             |              |                  |              |           |
 Then the response should be 422

 @new
 Scenario: Able to create product if price is not numeric, and it should set to 0
 When I send POST request to create new product with:
 | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
 | Loremipsum      | asdf   |             |              |                  |              |           |
 Then the response should be 201
 And product name should be "Loremipsum" and price 0

@new
Scenario: Able to create a product by specifying all the attributes
When I send POST request to create new product with:
 | name        | price | description           | available_on | meta_description | meta_keyword | taxon_ids |
 | Lorem Ipsum | 100   | lorem ipsum dolor sit |   2013/07/15 |                  |              | 39        |
 Then the response should be 201
 And product name should be "Lorem Ipsum" and price 100


@search
Scenario: As an admin, I am able to search product
  When I send GET request for search of product having keyword "new"
  Then the response for product listing should be 200
  And the JSON response should be an hash having an array of products
  And products name should contain keyword "New" in their name
  
@show
Scenario: As an admin I am able to view the details of specific product using permalink
  When I send the GET request for the prodcut having permalink "laptop-bag-for-college"
  Then the response for product details should be 200
  And the product detail should contain details of product, its variants and product properties 

@show
Scenario: As an admin I am able to view the details of specific product using id
  When I send the GET request for the prodcut having id 64
  Then the response for product details should be 200
  And the product detail should contain details of product, its variants and product properties
@show
Scenario: As an admin I should get no results if permalink does not exist
  When I send the GET request for the prodcut having permalink "something-not-present"
  Then the response for product details should be 404

@show
Scenario: As an admin I should get no results if id does not exist
  When I send the GET request for the prodcut having id 100000
  Then the response for product details should be 404

@update
Scenario: As an admin I should be able to update product
When I send PUT request to update product with:
| permalink |  price | 
| laptop-bag-for-college   |  100   |
Then the response should be 200

@update
Scenario: As an admin I should not be able to update product to blank name
When I send PUT request to update product with:
| permalink |  name | 
| laptop-bag-for-college   |  |
Then the response should be 422

@delete
Scenario: As an admin I should be able to delete product by permalink
 When I send POST request to create new product with:
 | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
 | Headphones | 100  |             |              |                  |              |           |
 Then the response should be 201
 And product name should be "Headphones" and price 100
 When I send DELETE request to delete the newly created product by permalink
 Then the response should be 204

 @delete
Scenario: As an admin I should be able to delete product by id
 When I send POST request to create new product with:
 | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
 | Headphones | 100  |             |              |                  |              |           |
 Then the response should be 201
 And product name should be "Headphones" and price 100
 When I send DELETE request to delete the newly created product by id
 Then the response should be 204

@delete
Scenario: As an admin I should not be able to delete product if permalink not exist
When I send DELETE request to delete product with:
| permalink    |   
|  exist-not   |
Then the response should be 404 

@delete
Scenario: As an admin I should not be able to delete product if id not exist
When I send DELETE request to delete product with:
| id    | permalink |
|  9999999   |  |
Then the response should be 404   
 