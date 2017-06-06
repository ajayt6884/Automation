Feature: User signup successful

 Background:
  Given i am on user signup page

 Scenario: Successfully signed up
  When I submit valid data in every field
  Then i will see the popup
  Then i will see the success message

Scenario: Successfully signed up
  When i enter the invalid data in email field
  Then i will see the error message email already register
  When i enter the invalid data in confirm_password field
  Then i will see the error message password does not match
  When i enter the invalid data in mobile field
  Then i will see the error message mobile is invalid

