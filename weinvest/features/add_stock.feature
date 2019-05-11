Feature: Check whether BT Group plc is added to the portfolio
  Given i am on modal-portfolio page


Scenario: Add BT Group plc to the portfolio
  When I select All Weather Strategy
  Then click on Customize Portfolio button
  Then I click on Customize button
  Then click on +Add Stock button
  Then click on add stock button in BT Group plc
  Then click on Done
  Then Check whether BT Group plc is added to the portfolio
