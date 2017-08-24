Feature: As a user I should not be able to complete order if any of the information  provided is wrong.
 
 Background: Given I am Logged in
   Given I am logged in with "vijay1@mailinator.com" and password "123456"
   Then I click on first product on listing page
   Then I add an item into cart
   Then I checkout
 
 @fail
    Scenario:  Unable to checkout using Fashion Bank when sufficient amount is not present
    Then I fill the default shipping details and continue
    Then I select shipping method "negiraian state" and continue
    Then I select payment mode "fashion_bank" and continue
    Then I should get a unsuccessful message "Payment could not be processed. Because you don't have sufficient amount in your wallet. Please choose another payment method with it."