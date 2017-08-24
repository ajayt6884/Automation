@demo
Feature: As a logged in user, i am able to checkout
 
 Background: Given I am Logged in
   Given I am logged in with "vijay@vinsol.com" and password "123456"
   Then I click on first product on listing page
   Then I add an item into cart
   Then I checkout

 Scenario:  Able to checkout using POD
   And I fill the shipping address
   And I fill the billing address
   And click Save and Continue
   Then I select shipping method "lagos island shipping"
   And click Save and Continue
   Then I select payment mode "pod"
   And click Save and Continue
   Then I should get a success message "Your order has been processed successfully"

 Scenario:  Able to checkout using default shipping details and BTD
   Then I fill the default shipping details and continue
   Then I select shipping method "lagos island shipping" and continue
   Then I select payment mode "btd" and continue
   Then I should get a success message "Your order has been processed successfully"

 #Scenario:  Able to checkout using default shipping details and Credit Card
 #  Then I fill the default shipping details and continue
 #  Then I select shipping method "lagos island shipping" and continue
 #  Then I select payment mode "credit_card" and continue
 #  Then I should get a success message "Your order has been processed successfully"


 Scenario:  Able to checkout using default shipping details and check
   Then I fill the default shipping details and continue
   Then I select shipping method "lagos island shipping" and continue
   Then I select payment mode "check" and continue
   Then I should get a success message "Your order has been processed successfully"
@fail
 Scenario:  Able to checkout using default shipping details and Fashion Bank
   Then I fill the default shipping details and continue
   Then I select shipping method "lagos island shipping" and continue
   Then I select payment mode "fashion_bank" and continue
   Then I should get a success message "Your order has been processed successfully"


