Feature: Home page links and route planner, settings, promotions, inbox, credit card feature
 As a user i should be able to visit all links of Chevron app
 And I should be able to apply for credit card 
 And I should be able to change/update settings
 And I should be able to see promotions
 And I should be able to serach the stations near address or near me 
 And I should be able to search the route
 
#========================================================================================#
 #Initial Apple pay screen (will pass when fresh app installed withut any cached data)
 @reset_app 
 Scenario: As a User, When I first time open the app, I view apple pay screen
  Given app launches successfully
  And I should see apple pay screen
  And take picture
  Then I close the screen
 
 #Dashboard
 Scenario: As a User I first time launch the app, I should view the dashboard
  Given I am on Dashboard
  And take picture
  Then I should see "Stations Near Me"
  Then I should see "Route Planner"
  Then I should see "Promotions"
  Then I should see "Chevron Cards"
  Then I should see "Inbox"
  Then I should see "Stations    Near Address"
  And I should see settings icon
  #verify chevron logo
  
 #========================================================================================#
 #Stations Near Me
 Scenario: As a user, When I open the app first time and go to sations near me, I should veiw Dieel Only filter.
  Given I am on Dashboard
  Then I tap on button "Stations Near Me"
  And I wait for "Stations Near Me" screen
  Then I should see deisel only filter
  And take picture
  And I select "No"
  Then Diesel Filter should get selected
  #verify menu btn, filter btn, screen label, deisel only bar, redo search btn
  And take picture  
 
 Scenario: As a User When I go to station near me, I should see station list near my location
  Given I am on Dashboard
  Then I tap on button "Stations Near Me"
  And I wait for "Stations Near Me" screen 
  And take picture
  Then I should see station list or no station found message
  
 #========================================================================================#
 #earch in Stations Near Address
 Scenario: As a User, i should be able to search stations near specific location
  Given I am on Dashboard
  Then I tap on button "Stations    Near Address"
  And I wait for "Stations    Near Address" screen
  Then I search stations near "San Francisco"
  And I select station "San Francisco, CA"
  And take picture
  Then I should see station list
  And station list should contain "1601 Mission St" at position "1"
  And station list should contain "1298 Howard St" at position "2"
  And I should see a "   How Does Techron Help?" button
  
  #Techron popup in Stations Near Address
 Scenario: As a User, I shoud be able to see how does techron help?
  Given I am on Dashboard
  Then I tap on button "Stations    Near Address"
  And I wait for "Stations    Near Address" screen
  Then I search stations near "San Francisco"
  And I select station "San Francisco, CA"
  Then I should see station list
  And I should see button "   How Does Techron Help?"
  When I touch the button "   How Does Techron Help?"
  Then I should see the techron popup
  And I closed it
 
  #verify menu btn, filter btn, screen label, deisel only bar, redo search btn, verify directions btn for each station
  #verify map selector, verify when rememberchoice ma selectio, its n setting
  
  #Station near Address- Station deatil view
  Scenario: As a User, I shoud be able to see station detail view
   Given I am on Dashboard
   Then I tap on button "Stations    Near Address"
   And I wait for "Stations    Near Address" screen
   Then I search stations near "San Francisco, CA"
   And I select station "San Francisco, CA"
   Then I should see station list
   And I select station at position "1"
   Then I should view station details
   And take picture
   Then I go back to station list
   #verify direction, call, 
 #=======================================================================================#  
 #Route Planner
 Scenario: As a User, I should be able to view route planner.
  Given I am on Dashboard
  Then I tap on button "Route Planner"
  And I wait for "Route Planner" screen
  Then I specify start location San Francisco
  And I specify end location San Ramon
  Then I should see stations count in route
  
 Scenario: As a User, I should be able plan route (add stations to route)
  Given I am on Dashboard
  Then I tap on button "Route Planner"
  And I wait for "Route Planner" screen
  Then I specify start location San Francisco
  And I specify end location San Ramon
  Then I should see stations count in route
  And I take picture
  
  #===============Analyzing bottom cell=================#
  When I tap on bottom cell
  And I should see tab Stations
  And I should see tab Stations Added
  And I should see station list
  And I should see ADD TO ROUTE button
  And take picture
   
  #===============Analyzing station detail===============#
  When I tap on station cell
  Then I should see station detail
  And take picture
  And I close the station detail view
  
  #===============Add to route============================# 
  And I should see station list
  When I tap on add to route
  And I should see added stations count

  When I tap on stations added
  Then I should see added stations list
  When I tap on station cell
  Then I should see station detail
  And take picture
  And I close the station detail view
  Then I should see added stations list
  
  #==============Remove from routes=======================#
  And I should see remove button
  When I tap remove button
  And I should see "You have not added any stations to be watched. Make a selection from the Stations list."
  And I tap on Menu Button 
  
  #===============Cache for route planner should be preservered==============#
  When I tap on "Route Planner" text
  And I wait for results
  Then I should see input field have previous addresses
  And I should see all results are present as per previous search
  And I tap on Menu Button  
   
 #=======================================================================================#  
 #Visiting PROMOTIONS page and taking picture
 #Pass for no promotion list
 Scenario: As a user I should see promotions
  When I tap on Promotions
  And take picture
  Then I should see promotions list or no promotion list
  #Then I should see featured promotions list
  #And I should see extramile promotions list
  Then take picture
  And I tap on Menu Button 
    
    
  
 #========================================================================================#  
  #Promotion list is not displaying
 Scenario: Featured promotions list details
  When I tap on Promotions
  And take picture
  Then I should see featured promotions list
  And I should see extramile promotions list
  Then I touch text "Save at the Pump"
  Then I should see "Sign Up For A Rewards Card" button
  And I should see "Use up to 20 cents per gallon in Rewards at participating Chevron or Texaco stations"
  And take picture
  And I touch text "Sign Up For A Rewards Card"
  Then I should see web view
  Then I should see web view
  Then I touch DONE
  Then I touch "Save at the Pump"
  And featured promotion detail section closed
  And take picture
  Then I should see featured promotions list
  
 #========================================================================================#
  #Promotion list is not displaying
  Scenario: Extramile Promotions List
   When I tap on Promotions
   And take picture
   Then I should see promotions list or no promotion list
   Then I should see featured promotions list
   And I should see extramile promotions list
   Then I touch text "Muscle Milk"
   Then I should see "Details" button
   And I should see text "Offer includes 14 oz. varieties of Muscle Milk. Does not include Muscle Milk Pro 40. Discount valid on multiples of two. "
   And take picture
   And I touch "Details"
   Then I should see offer details content
   Then I close the offer detail popup
   Then I touch "Muscle Milk"
   And promotion detail offer should get close
          
    
  #=======================================================================================# 
  #Credit Cards
  #Visiting CREDIT CARD PAGE and Features for CREDIT CARD PAGE
  Scenario: As a user I should see credit card
    When I tap on button "Chevron Cards" 
    Then I should see chevron cards screen
    And I should see text Credit Cards
    And I wait to see "Earn Xponent Rewards with every qualifying purchase"

    #=========CREDIT CARD APPLY TODAY=============#
    Then I tap on button LEARN MORE of credit cards
    And I tap on APPLY TODAY button
    Then I should be redirected to credit card "Apply Today" page
    And take picture
    And I touch DONE
  
    #=========CREDIT CARD LOGIN==================#  
    When I tap on LOGIN button
    Then I should be redirected to credit card "Login" page
    And take picture
    And I touch DONE
    And I tap on left arrow
   # Then I should see chevron cards screen
   
 #========================================================================================#
 #Features for SETTINGS enabling and disabling
 #Settings
  Scenario: As a user I should see settings
   When I tap on Settings icon
   And I should see "Show me both Chevron and Texaco station results"
   And I should see "Settings" in header
   And default setting is enabled
   When I "disable" the "Show me both Chevron and Texaco station results"
   Then setting should get "disable"
   And take picture
   And I "enable" the "Show me both Chevron and Texaco station results"
   Then setting should get "enable"
   And take picture
   And I tap on Menu Button
   

   
   
  