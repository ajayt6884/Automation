Feature: As an admin able to list TAXONOMIES
  
 Scenario: As an admin I am able to list all the taxonomies
   When I send GET request to view list of all taxonomy
   Then the response should be 200
   And the response should contain hash of taxonomy

Scenario: As an admin able to search Taxonomy
 When I send SEARCH request for a taxonomy by "name" "Brand"
 Then the response should be 200
 And the response should contain hash of attributes of taxonomy "name" "Brand"

Scenario: As an admin able to view Taxonomy details using id
  When I send GET request to view list of taxonomy having id "1"
  Then the response should be 200
  And the response should contain hash of details of taxonomy having id "1"

Scenario: As an admin able to update new Taxonomy
 When I send POST request to update taxonomy having id "1" "name" to "Categoryy"
 Then the response should be 200
 And the response should contain taxonomy having id "1" with updated "name" "Categoryy"
 When I send POST request to update taxonomy having id "1" "name" to "Categories"
 And the response should contain taxonomy having id "1" with updated "name" "Categories"


Scenario: As an admin able to create and delete Taxonomy
 When I send POST request to create a new taxonomy with name "Favourite"
 Then the response should be 201
 And the response should contain taxonomy having "name" "Favourite"
 When I send DELETE request for taxonomy "name" "Favourite"
 Then the response should be 204
 And the JSON response should be empty
 

@Taxon_CRUD
Scenario: As an admin able to create new Taxon
 When I send POST request to create a new taxonomy with name "Favourite"
 Then the response should be 201
 And the response should contain taxonomy having "name" "Favourite"
 
 #create Taxon
 When I send POST request to create a new taxon with name "Favourite 1"
 Then the response should be 201
 And the response should contain taxon having "name" "Favourite 1"
 
 #update Taxon
 When I send UPDATE request to update taxon "name" to "Fav 1"
 Then the response should be 200
 
 #create Taxon
 When I send POST request to create a new taxon with name "Favourite 2"
 Then the response should be 201
 And the response should contain taxon having "name" "Favourite 2"
 
 #update Taxon
 When I send UPDATE request to update taxon "name" to "Fav 2"
 Then the response should be 200
 
 #delete Taxon
 When I send DELETE request for taxon "name" "Fav 1"
 Then the response should be 204
 And the JSON response should be empty
 
 #delete Taxon
 When I send DELETE request for taxon "name" "Fav 2"
 Then the response should be 204
 And the JSON response should be empty

 #delete Taxonomy
 When I send DELETE request for taxonomy "name" "Favourite"
 Then the response should be 204
 And the JSON response should be empty

 

