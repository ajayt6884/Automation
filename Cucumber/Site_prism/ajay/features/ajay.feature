Feature: Add To Cart

Background:
  Given i m on deal detail page

Scenario:
  When i select a option value
  Then i click on buy button
  Then deal is added to my cart
