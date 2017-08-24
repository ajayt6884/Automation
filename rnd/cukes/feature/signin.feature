@set1

Feature: As a visitor I should be able to sigin

 Background:
  Given I am on RND home page
  Then I click on Login
 @q
 Scenario: I should be able to login with correct credentials
  And I Signin with:
  | email                 | password |
  | vijay@vinsol.com      | 123456   |
  Then I should see MY ACCOUNT

  Scenario: I should not be able to login with incorrect email
  And I Signin with:
  | email                 | password   |
  | vijay@vinsol.com      | 12345678   |
  Then I should get error "Invalid email or password."

  Scenario: I should not be able to login with incorrect password
  And I Signin with:
  | email                      | password |
  | vviijjaayy@vinsol.com      | 123456   |
  Then I should get error "Invalid email or password."

  


