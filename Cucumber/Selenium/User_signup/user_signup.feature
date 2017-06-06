Feature: User signup

 Background:
  Given i am on user signup page

 Scenario: Successfully signed up
  When I submit valid data in every field
  Then I should receive a message about mail

 Scenario Outline: Signup using invalid data
  When I submit "<name>","<email>","<password>","<confirm password>","<phone number>","<address>","<state>","<locality>","<company>
  Then I should be displayed error message "<message>" for field "<field>"

  Examples:
   |name |      email     |password|confirm password|phone number|address|state|locality   |company |message               |field|
   |ayush|ayush+00@vinsol.com|123456  |1234567         |9810914476  | c/2   |Delhi|Patel nagar| blank  |doesn't match Password|confirm_password|
   |ayush|ayush@vinsol.com|123456  |123456          |9810914476  | c/2   |Delhi|Patel nagar| blank  |has already been taken|email|
   |ayush|ayush+00@vinsol.com|123456  |123456        |981091447610| c/2   |Delhi|Patel nagar| blank  |is the wrong length (should be 10 characters)|phone_number|
   |ayush|ayush+00@vinsol.com|123456  |123456        |9810914476||Delhi|Patel nagar| blank  |can't be blank|address|
   |ayush|ayush+00@vinsol.com|123456  |123456        |9810914476|c/2|Delhi|| blank  |can't be blank|location|













