Feature: User signup

 Background:
  Given i am on user signup page

 Scenario: Successfully signed up
  When I submit valid data in every field
  Then i will see the success message

Scenario Outline: Signup using invalid data
  When I submit "<name>","<email>","<password>","<confirm password>","<mobile>"
  Then I should be displayed error message "<message>" for field "<field>"

  Examples:
   |name|      email              |password|confirm password|mobile       |message                                      |field|
   |ajay|ajay.thakur56@vinsol.com   |123456  |1234567         |09999999992  |Confirm Password does not match with password|confirm_password|
   |ajay|ajay.thakur@vinsol.com   |123456  |123456          |09999999992  |Email already exists                         |email|
   |ajay|ajay.thakur57@vinsol.com|123456  |123456          |98109144761  |Mobile is invalid                            |mobile|













