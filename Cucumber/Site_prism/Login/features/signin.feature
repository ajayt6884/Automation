Feature: Successful User signin

 Background:
  Given i am on user signin page

 Scenario: Successfully signed in
  When I submit valid data in every field
  Then i will see the success message

Scenario: Unsuccessful signed in
  When i submit invalid data
  Then i will see error message













