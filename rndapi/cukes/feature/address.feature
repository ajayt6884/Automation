Feature: As an admin able to view ADDRESSES

  @update @show
  Scenario: As an admin I am able to edit address of users
  When I send UPDATE request to an address for following fields with:
  |id |firstname | lastname |address1       |address2  |city      |zipcode|
  |195|Vijay     |sah       |123 New street |River Side Road| Town city|10010  |
  Then the response should be 200
  When I send UPDATE request to an address for following fields with:
  |id |firstname | lastname |address1       |address2  |city      |zipcode|
  |195|Vij      |Sah       |123 New Street |River Side Road| Town city|10020  |
  Then the response should be 200
  When I send GET request to view address details of an address id "195"
  Then the response should be 200
  And the response should contain hash of address with:
  |id |firstname | lastname |address1       |address2  |city      |zipcode|
  |195|Vij      |Sah       |123 New Street |River Side Road| Town city|10020  |
 

 Scenario: As an admin I am able to edit address of users and save the blank fields
  When I send UPDATE request to an address for following fields with:
  |id |firstname | lastname |address1       |address2  |city      |zipcode|
  |195|Vijay     |sah       |123 New street |River Side Road| Town city|10010  |
  Then the response should be 200
  When I send UPDATE request to an address for following fields with:
  |id |firstname | lastname |address1       |address2  |city      |zipcode|
  |195|     |Sah      |123 New street |River Side Road| Town city|10010  |
  Then the response should be 422
  When I send GET request to view address details of an address id "195"
  Then the response should be 200
  And the response should contain hash of address with:
  |id |firstname | lastname |address1       |address2  |city      |zipcode|
  |195|Vijay     |sah       |123 New street |River Side Road| Town city|10010  |


  Scenario: As a non admin user, I am not able to view address
  When non admin user send GET request to view address details of an address id "195"
  Then the response should be 401
  And the response should contain text "You are not authorized to perform that action."


  Scenario: As a Non admin User, I am able to view my address
  When non admin user send GET request to view address details of an address id "196"
  Then the response should be 200
  And the response should contain hash of address with:
  |id |firstname | lastname |
  |196|Vij       |Mailinator |
 
@run
Scenario: As a Non Admin User, I am not able to view other' address
 When non admin user send GET request to view address details of an address id "195"
 Then the response should be 401
 And the response should contain text "You are not authorized to perform that action."