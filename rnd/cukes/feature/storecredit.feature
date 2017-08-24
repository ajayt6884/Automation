@set2
Feature: As an admin I am able to credit/debit store credit of user

  Background: I am logged in as admin and in configuration section
    Given I am logged in as admin
    And go to Users
    And search the user "anu137@ymail.com"
 
 Scenario: I am able to credit store credit to user
   And click the "credit" button for user "anu137@ymail.com"
   And specify the details amount "1000", "Refund", "To test" and submit the form
   Then I should get a success message "Credit has been successfully created!"

 Scenario: I am able to debit store credit to user
   And click the "debit" button for user "anu137@ymail.com"
   And specify the details amount "1000", "Deduce", "To test" and submit the form
   Then I should get a success message "Debit has been successfully created!"

 Scenario: Should not be able to credit store credit to user without amount, payment mode and reason
   And click the "credit" button for user "anu137@ymail.com"
   And submit the blank credit_debit form
   Then I should see the error message "Amount can't be blank"
   Then I should see the error message "Reason can't be blank"
   Then I should see the error message "Payment mode is not included in the list"

  Scenario: Should not be able to debit store credit to user without amount, payment mode and reason
    And click the "debit" button for user "anu137@ymail.com"
    And submit the blank credit_debit form
    Then I should see the error message "Amount can't be blank"
    Then I should see the error message "Reason can't be blank"
    Then I should see the error message "Payment mode is not included in the list"

  Scenario: Credit Amount should be numeric
    And click the "credit" button for user "anu137@ymail.com"
    And specify the details amount "10a", "Refund", "To test" and submit the form
    Then I should see the error message "Amount is not a number"

  Scenario: Debit Amount should be numeric
    And click the "debit" button for user "anu137@ymail.com"
    And specify the details amount "10a", "Deduce", "To test" and submit the form
    Then I should see the error message "Amount is not a number"


 Scenario: Verify that user has balance in store credit or not
   And click the "view" button for user "anu137@ymail.com"
  # Then store credit in column "BALANCE" should be greater than 0.00