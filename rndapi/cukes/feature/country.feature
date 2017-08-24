Feature: As an admin able to list COUNTRIES
 
 @index 
 Scenario: As an admin able to view list of all countries
  When I send GET request to view country list 
  Then the response should be 200
  And the response contain hash of 227 country

 @search 
 Scenario: As an admin able to search countries
  When I send GET request to search country by "name" "Nigeria"
  Then the response should be 200
  And the response contain hash of countries having "Nigeria" in their name

@show 
Scenario: As an admin user able to view details of a country
  When I send GET request to view country having id "33"
  Then the response should be 200
  And the response contain hash of country id "33"


  @index  @non-admin @run
 Scenario: As non admin user able to view list of all countries
  When non admin user send GET request to view country list 
  Then the response should be 200
  And the response contain hash of 227 country

 @search @non-admin @run 
 Scenario: As non admin user able to search countries
  When non admin user send GET request to search country by "name" "Nigeria" 
  Then the response should be 200
  And the response contain hash of countries having "Nigeria" in their name

  @show @non-admin @run
Scenario: As non admin user able to view details of a country
  When non admin user send GET request to view country having id "33"
  Then the response should be 200
  And the response contain hash of country id "33"

