Feature: Home page

Background:
Given i am on signin page 

Scenario: Successful Signin
When i submit valid data in every field
Then i will see the  success message

Scenario: Unsuccessful Signin
When i submit in valid data
Then i will see the error message Invalid email or password

