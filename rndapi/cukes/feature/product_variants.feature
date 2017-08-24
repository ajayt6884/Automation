Feature: As an admin able to list product variants

@index
 Scenario: Able to list product variants
 When I send POST request to create new product with:
 | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
 | New Headphones | 10  |             |              |                  |              |           |

 Then the response should be 201
 #Option values ids 55, 56(Jeans Size as option1) and 52(Jeans Color as option2)
 Then I send the CREATE request to create variant of a product with option values
 | option1 | option2 |
 | 55      | 52      |
 
 Then the response should be 201
 And I send the request to list variants of product
 Then the response should be 200
 And the json response should contain the newly created variant in hash of varaint in array

#@search
#Scenario: To search for a particular variant
 

@show
Scenario: To view the details for a single variant using id
 When I send POST request to create new product with:
 | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
 | New Headphones | 10  |             |              |                  |              |           |

 Then the response should be 201
 #Option values ids 55, 56(Jeans Size as option1) and 52, 53(Jeans Color as option2)
 Then I send the CREATE request to create variant of a product with option values
 | option1 | option2 |
 | 55      | 53      |
 
 Then the response should be 201
 And I send SHOW request to list specific variant of product
 Then the response should be 200
 And the json response should contain hash of varaint
 | option1 | option2 |
 | 55      | 53      |
 

@new @run
Scenario: To view the attributes (required and non-required) for a variant
 When I send POST request to create new product with:
 | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
 | New Headphones | 100  |             |              |                  |              |           |

 Then the response should be 201
 Then I send the GET request for the attributes of variant of a product
 Then the response should be 200
 And the json response should contain attributes and required_attributes key

@create
Scenario: To create a new variant for a product
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

@update
Scenario: To update a variant's details (update sku)
When I send POST request to create new product with:
 | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
 | New Headphones | 10  |             |              |                  |              |           |

 Then the response should be 201
 #Option values ids 55(Jeans Size as option1) and 52(Jeans Color as option2)
 Then I send the CREATE request to create variant of a product with option values
 | option1 | option2 |
 | 55      | 52      |
 Then the response should be 201
 And the json response should contain hash of varaint
 | option1 | option2 |
 | 55      | 52      |
 When I send UPDATE request to variant of a product with option values
 | price | width | height | depth | 
 | 90    | 90    |  90    |  90   |
 Then the response should be 200
 And the json response should contain hash of varaint attributes
 | price | width | height | depth | 
 | 90    | 90    |  90    |  90   |

@delete 
Scenario: To delete a variant
 When I send POST request to create new product with:
 | name  | price | description | available_on | meta_description | meta_keyword | taxon_ids |
 | New Headphones | 10  |             |              |                  |              |           |

 Then the response should be 201
 #Option values ids 55(Jeans Size as option1) and 52(Jeans Color as option2)
 Then I send the CREATE request to create variant of a product with option values
 | option1 | option2 |
 | 55      | 52      |
 Then the response should be 201
 And the json response should contain hash of varaint
 | option1 | option2 |
 | 55      | 52      |
 When I send UPDATE request to variant of a product with option values
 | price | width | height | depth | 
 | 90    | 90    |  90    |  90   |
 Then the response should be 200
 And the json response should contain hash of varaint attributes
 | price | width | height | depth | 
 | 90    | 90    |  90    |  90   |
 When I send DELETE request to delete variant of a product
 Then the response should be 204
 And I send the request to list variants of product
 Then the deleted variant should not be listed