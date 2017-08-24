Feature: As a logged in user, i am able to checkout

  Background: Given I am Logged in
    Given I am logged in with "vijay@vinsol.com" and password "123456"
    Then I click on first product on listing page
    Then I add an item into cart
    Then I checkout
@fail
  Scenario:  Able to checkout using Fashion Bank and POD
    Then I fill the default shipping details and continue
    Then I select shipping method "negiraian state" and continue
    Then I select payment mode fashion_bank and "pod" and continue
    Then I should get a success message "Your order has been processed successfully"
    And payment info should have payment mode "Fashion Bank", "POD"
@fail
  Scenario:  Able to checkout using Fashion Bank and BTD
    Then I fill the default shipping details and continue
    Then I select shipping method "negiraian state" and continue
    Then I select payment mode fashion_bank and "btd" and continue
    Then I should get a success message "Your order has been processed successfully"
    And payment info should have payment mode "Fashion Bank", "BTD"
@fail
  Scenario:  Able to checkout using Fashion Bank and check
    Then I fill the default shipping details and continue
    Then I select shipping method "negiraian state" and continue
    Then I select payment mode fashion_bank and "check" and continue
    Then I should get a success message "Your order has been processed successfully"
    And payment info should have payment mode "Fashion Bank", "check"