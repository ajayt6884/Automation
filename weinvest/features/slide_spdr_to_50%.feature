Feature: Make SPDR S&P 500 ETF TRUST SPY US EQUITY to 50%
  Given i am on modal-portfolio page


Scenario: Slide SPDR S&P 500 ETF TRUST SPY US EQUITY to 50%
  When I select “All Weather Strategy”
  Then click on “Customize Portfolio” button
  Then I click on “Customize” button
  Then slide SPDR S&P 500 ETF TRUST SPY US EQUITY to 50%
  Then click on “Rebalance” button
  Then click on “Invest” button
  Then verify “SPDR...” under “What your portfolio contain ?” to be 50%
