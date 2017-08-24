Feature: User interaction with chevron cards
  1. Verification of Chevron card screen (prepaid card/credit cards)
  2. PC -> Signup screen
  3. PC -> Login screen
  4. Chevron cards -> after login into prepaid cards
  5. Add fund from chevron cards
  6. Prepaid Card screen
  7. Add fund from prepaid cards
  8. Add fund screen
  9. card activity screen
  10. Xponent rewards screen
  11. merchant offers
  12. suport
  13. reset
 
 
  #1. Verification of Chevron card screen (prepaid card/credit cards)
  Scenario: As a User I should see chevron cards screen 
    Given I am on Dashboard
    Then I should see "Chevron Cards"
    And I am not logged in prepaid card
    And I touch the "Chevron Cards" button
    Then I should see Chevron cards screen
    
  #2. PC -> Signup screen
  Scenario: As a Visitor, I should be able to visit Signup Screen
    Given I am on Dashboard
    And I am not logged in prepaid card
    And I goto login screen of Prepaid Cards
    Then I should see "SIGN UP"
    And I tap on the "SIGN UP" button
    Then I should see header "Sign Up"
    
    
  #3. PC -> Login screen
  Scenario: As a Visitor, I should be able to visit Signin Screen
  Given I am on Dashboard
  And I am not logged in chevron cards
  Then I tap on button "Chevron Cards" 
  Then I tap on button LEARN MORE of prepaid cards
  And I should see login screen
    
  #===== Unsuccessfull Login
  Scenario: As a User, I should not be able to login into prepaid card section with invalid email
    Given I am on Dashboard
    And I am not logged in chevron cards
    Then I tap on button "Chevron Cards" 
    Then I tap on button LEARN MORE of prepaid cards
    And I should see login screen
    And I login with invalid email credentials
    Then I should see error message
    And I tap on OK
    Then I should see login screen
 

  Scenario: As a User, I should not be able to login into prepaid card section when failed login limit is reached(with invalid password)
    Given I am on Dashboard
    And I am not logged in chevron cards
    Then I tap on button "Chevron Cards" 
    Then I tap on button LEARN MORE of prepaid cards
    And I should see login screen
    And I try to login even after failed login limt is reached
    Then I should see error message for failed login limit reached
    And I tap on OK
    Then I should see login screen
  
  #4.Chevron cards ->Successfull Login
  Scenario: As a User I should be able to login into prepaid card section
    Given I am on Dashboard
    And I am not logged in chevron cards
    Then I tap on button "Chevron Cards" 
    Then I tap on button LEARN MORE of prepaid cards
    And I should see login screen
    Then I login with valid credentials
    And I should get login
    And I should see current funds available
    And I should see button to add funds
    And I should see button to see more info
 
 #=====Add fund====#
  #5.a Add fund from chevron cards
  Scenario: As a User I should be able to add funds to prepaid cards using predefined value
    Given I am on Dashboard
    And I am logged in chevron cards
    Then I should see button to add funds
    And I tap on button add funds
    Then I should see predefined amount to add funds
    Then I select amount 25.00
    And select payment method
    And Submit
    Then I should asked for password
    And I specify the password and tap on OK
    And I should see toss message success
 
  #5.b Add fund from chevron cards
  Scenario: As a User I should be able to add funds to prepaid cards using specifying value
    Given I am on Dashboard
    And I am logged in chevron cards
    Then I should see button to add funds
    And I tap on button add funds
    Then I specify amount "10.00"
    And select payment method
    And Submit
    Then I should asked for password
    And I specify the password and tap on OK
    And I should see toss message success
    
    
  #6. Prepaid Card screen
  Scenario: As a User, I should be able to view Prepaid card screen
    Given I am on Dashboard
    And I am logged in chevron cards
    And I tap on More button
    Then I should see Prepaid card screen
  
    
  #7. Add fund from prepaid card screen
  Scenario: As a user, When I submit add fund form without selecting amount, then I should see error message
    Given I am on Dashboard
    And I am logged in chevron cards
    And I goto Prepaid Card screen
    Then I should see button to add funds on prepaid card screen
    And I tap on button add funds on prepaid card screen
    And Submit
    Then I should see error message for amount
    Then I close the error modal
    

  Scenario: As a User I should be able to add funds from prepaid card screen using predefined value
    Given I am on Dashboard
    And I am logged in chevron cards
    And I goto Prepaid Card screen
    Then I should see button to add funds on prepaid card screen
    And I tap on button add funds on prepaid card screen
    Then I should see predefined amount to add funds
    Then I select amount 25.00
    And select payment method
    And Submit
    Then I should asked for password
    And I specify the password and tap on OK
    And I should see toss message success
          
  #8. Add fund screen
  Scenario: As a User I should be able to add funds from prepaid cards using specifying value
    Given I am on Dashboard
    And I am logged in chevron cards
    And I goto Prepaid Card screen 
    Then I should see button to add funds on prepaid card screen
    And I tap on button add funds on prepaid card screen
    Then I specify amount "10.00"
    And select payment method
    And Submit
    Then I should asked for password
    And I specify the password and tap on OK
    And I should see toss message success  
      
  #9. card activity screen
  Scenario: As a User, I should be able to view card activity screen
    Given I am on Dashboard
    And I am logged in chevron cards
    And I goto Prepaid Card screen
    Then I should see button to view activity
    And I tap on button view activity
    And I should see card activity screen
      
  #10. Xponent rewards screen
  Scenario: As a User, I should be able to view Xponent rewards screen
    Given I am on Dashboard
    And I am logged in chevron cards
    And I goto Prepaid Card screen
    And I tap on xponent reward button
    Then I should see xponent rewards details
  
  #11. merchant offers
  Scenario: As a User, I should be able to view merchant offers
    Given I am on Dashboard
    And I am logged in chevron cards
    And I goto Prepaid Card screen
    And I tap on view merchant offer
    Then I should see merchant offer screen
    
  #12. support
  Scenario: As a User, I should be able to view support screen
    Given I am on Dashboard
    And I am logged in chevron cards
    And I goto Prepaid Card screen
    And I tap on support
    Then I should see support screen
    
  #13. reset
  Scenario: As a User, I should be able to view reset screen
    Given I am on Dashboard
    And I am logged in chevron cards
    And I goto Prepaid Card screen  
    And I tap on reset pin
    Then I should see reset pin screen
    
    
  #14. Navigation between different screen
  Scenario: As a User, I should be able to navigate between different screen
    Given I am on Dashboard
    And I am logged in chevron cards
    And I goto Prepaid Card screen    