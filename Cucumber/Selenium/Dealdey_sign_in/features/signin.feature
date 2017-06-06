Feature: User signin

 Background:
  Given i am on user signin page

 Scenario: Successfully signed up
  When I submit valid data in every field

 Scenario Outline: Signin using invalid data
  When I submit "<email>","<password>"
  Then I should be displayed error message "<message>" for field "<field>"

  Examples:
   |      email             |password  |       message             |    field     |
   |ajay.thakur+2@vinsol.com|jaythakur |Invalid email or password. |email,password|














