 
 
 Then /^I should see Chevron cards screen$/ do
   #Verify the content of prepaid card screen
   wait_for_element_exists("label marked:'Prepaid Cards'")
   wait_for_none_animating
   expect(element_exists("label marked:'Prepaid Cards'")).to eq true
   expect(element_exists("label marked:'Save 5¢ per gallon every time you fuel at Chevron Texaco stations.'")).to eq true
   expect(element_exists("label marked:'Earn additional rewards on fuel when you use the card at participating merchants.'")).to eq true
   
   expect(element_exists("label marked:'Credit Cards'")).to eq true
   expect(element_exists("label marked:'Earn Xponent Rewards with every qualifying purchase'")).to eq true 
  
   expect(query("label marked:'LEARN MORE >'").length).to eq 2
 end
 
 And /^I am not logged in prepaid card$/ do  
    touch("button marked:'icon setting active gry'")  #touch setting button
    wait_for_none_animating
    if element_exists("button marked:'btn logout'")
      touch("button marked:'btn logout'")  #touch logout button
      wait_for_element_does_not_exists("button marked:'btn logout'") 
      touch("button marked:'btn nav menu up'")
    else
      touch("button marked:'btn nav menu up'")
    end
    wait_for_none_animating
 end
 
 And /^I goto screen "(.*?)"$/ do |screen|
   touch("button marked:'{screen}'")
 end
 
 And /^I goto login screen of Prepaid Cards$/ do
   wait_for_element_exists("button marked:'Chevron Cards'")
   touch("button marked:'Chevron Cards'")
   wait_for_element_exists("button marked:'LEARN MORE >' index:0")
   touch("button marked:'LEARN MORE >' index:0")
   wait_for_elements_exist("label marked:'Not an Xponent Rewards cardholder?'")
 end
 
 And /^I tap on the "SIGN UP" button$/ do
   wait_for_elements_exist("button marked:'SIGN UP'")
   sleep(2)
   touch("button marked:'SIGN UP'")
   
 end
 
 Then /^I should see header "(.*?)"$/ do |header|
   expect(element_exists("label marked:'#{header}'")).to eq true
   
 end

 
 Then /^I tap on button LEARN MORE of prepaid cards$/ do
   wait_for_none_animating
   touch("button marked:'LEARN MORE >'")
   wait_for_none_animating
  end
   
 And /^I should see login screen$/ do
   #verify element on login screen
   
   expect(element_exists("label marked:'Prepaid Login'")).to eq true
   expect(element_exists("label marked:'LOGIN'")).to eq true
   expect(element_exists("label marked:'Need Help?'")).to eq true
   expect(element_exists("label marked:'Not an Xponent Rewards cardholder?'")).to eq true
   expect(element_exists("label marked:'SIGN UP'")).to eq true
 end
 
 Then /^I login with valid credentials$/ do
   wait_for_none_animating
   #wait_for_elements_exist("UITextFieldLabel marked:'Email'")
   #expect(element_exists("UITextFieldLabel marked:'Email'")).to eq true
   #expect(element_exists("UITextFieldLabel marked:'Password'")).to eq true
   expect(query("UITextField").length).to eq 2
   touch("UITextField index:0")
   clear_text("UITextField index:0")
   keyboard_enter_text('testcustomer2004@marqeta.com')
   touch("UITextField index:1")
   clear_text("UITextField index:1")
   keyboard_enter_text('Password123@')
   tap_keyboard_action_key
   #touch("button marked:'LOGIN'")
end

 And /^I should get login$/ do
   wait_for_none_animating
   wait_for_elements_exist("label marked:'ADD FUNDS'")
   expect(element_exists("label marked:'Chevron Cards'")).to eq true
   expect(element_exists("label marked:'ADD FUNDS'")).to eq true
   expect(element_exists("label marked:'CURRENT FUNDS AVAILABLE'")).to eq true
 end
 
 And /^I should see current funds available$/ do
    wait_for_none_animating
   element_exists("label marked:'CURRENT FUNDS AVAILABLE'")
 end
 
 
 And /^I should see button to add funds$/ do
   wait_for_none_animating
   expect(element_exists("button marked:'ADD FUNDS'")).to eq true
 end
 
 And /^I should see button to add funds on prepaid card screen$/ do
   wait_for_none_animating
   expect(element_exists("button marked:'+ ADD FUNDS'")).to eq true
 end
 
 
 
 And /^I should see button to see more info$/ do
   wait_for_none_animating
   expect(element_exists("button marked:'MORE >'")).to eq true
 end
 
 
 And /^I tap on button add funds$/ do
   wait_for_none_animating
   touch("button marked:'ADD FUNDS'")
 end
 
 And /^I tap on button add funds on prepaid card screen$/ do
   wait_for_none_animating
   touch("button marked:'+ ADD FUNDS'")
 end
 
 Then /^I should see predefined amount to add funds$/ do
   wait_for_none_animating
   until_element_exists("UIView id:'loader_animation.png'")
   wait_for_element_exists("button marked:'$25.00'")
   expect(element_exists("button marked:'$25.00'")).to eq true
   expect(element_exists("button marked:'$50.00'")).to eq true
   expect(element_exists("button marked:'$100.00'")).to eq true
   expect(element_exists("button marked:'$200.00'")).to eq true
 end
 
 Then /^I select amount 25.00$/ do
  touch("button marked:'$25.00'")
 end
 
 Then /^I specify amount "(.*?)"$/ do |amt|
   wait_for_elements_exist("UITextField")
   touch("UITextField")
   amt = amt.to_i * 100
   keyboard_enter_text("#{amt.to_s}")
   touch("button marked:'DONE'")  
 end
 
 And /^select payment method$/ do
  wait_for_elements_exist("button marked:'checking (...7137)'")
  touch("button marked:'checking (...7137)'")
  wait_for_none_animating
  wait_for_elements_exist("button marked:'Done'")
  touch("button marked:'Done'")
 end
 
 And /^Submit$/ do
   wait_for_none_animating
   wait_for_elements_exist("button marked:'Submit'")
   touch("button marked:'Submit'")
 end
 
 Then /^I should asked for password$/ do
   #wait_for_none_animating
   element_exists("label marked:'Please confirm your password.'")
   element_exists("label marked:'Your Xponent Password'")
   
 end
 
 And /^I specify the password and tap on OK$/ do
   keyboard_enter_text('Password123@')
   touch("label marked:'OK'")
 end
 
 And /^I should see toss message success$/ do
   wait_for_elements_exist("UIImageView id:'img_success'")
   expect(element_exists("UIImageView id:'img_success'")).to eq true
   
 end
 
 And /^I am not logged in chevron cards$/ do
   touch("button marked:'icon setting active gry'")
   wait_for_none_animating
   if element_exists("button marked:'btn logout'")
     touch("button marked:'btn logout'")     
   end 
   touch("button marked:'btn nav menu up'")
    wait_for_none_animating
 end
 
 And /^I am logged in chevron cards$/ do
   touch("button marked:'icon setting active gry'")
   wait_for_none_animating
   p !element_exists("button marked:'btn logout'")
   if element_exists("button marked:'btn logout'")
     touch("button marked:'btn nav menu up'")
     wait_for_none_animating
     steps %{Then I tap on button "Chevron Cards"}
   else
     steps %{
      And I tap on Menu Button
      Then I tap on button "Chevron Cards"  
      Then I tap on button LEARN MORE of prepaid cards
      And I should see login screen
      Then I login with valid credentials
      And I should get login
     }          
   end  
 end
 
 And /^I tap on More button$/ do
   wait_for_elements_exist("button marked:'MORE >'")
   touch("button marked:'MORE >'")
  end 
 
 Then(/^I should see Prepaid card screen$/) do
   wait_for_elements_do_not_exist("UIView id:'loader_animation.png'")
   expect(element_exists("label marked:'Prepaid Cards'")).to eq true
   expect(element_exists("label marked:'CURRENT FUNDS AVAILABLE'")).to eq true
   expect(element_exists("label marked:'NEXT VISIT\\'S XPONENT REWARDS'")).to eq true
   
   #Verifying buttons
   expect(element_exists("button marked:'+ ADD FUNDS'")).to eq true
   expect(element_exists("button marked:'VIEW ACTIVITY'")).to eq true
   expect(element_exists("button marked:'Support'")).to eq true
   expect(element_exists("button marked:'VIEW MERCHANT OFFERS'")).to eq true
   expect(element_exists("button marked:'Reset Pin'")).to eq true
   
 end
 
 And /^I login with invalid email credentials$/ do
   wait_for_none_animating
   expect(query("UITextField").length).to eq 2
   touch("UITextField index:0")
   clear_text("UITextField index:0")
   keyboard_enter_text('testcustomer20041@marqeta.com')
   touch("UITextField index:1")
   clear_text("UITextField index:1")
   keyboard_enter_text('Password123@')
   tap_keyboard_action_key
 end
 
 And /^I try to login even after failed login limt is reached$/ do
   wait_for_none_animating
   expect(query("UITextField").length).to eq 2
   touch("UITextField index:0")
   clear_text("UITextField index:0")
   keyboard_enter_text('testcustomer2004@marqeta.com')
   touch("UITextField index:1")
   clear_text("UITextField index:1")
   keyboard_enter_text('Password123@1')
   tap_keyboard_action_key
   
   ##User is locked out for excceding failing login limit.
 end
 
 Then /^I should see error message$/ do
   wait_for_elements_do_not_exist("UIImageView id:'loader_animation.png'")
   expect(element_exists("label marked:'Invalid Credentials'")).to eq true
   expect(element_exists("label marked:'Invalid email and/or password.'")).to eq true
 end
 
 Then /^I should see error message for failed login limit reached$/ do
   #wait_for_none_animating
   wait_for_elements_do_not_exist("UIImageView id:'loader_animation.png'")
   expect(element_exists("label marked:'User is locked out for exceeding failed login limit'") || element_exists("label marked:'Invalid email and/or password.'")).to eq true
 end
 And /^I tap on OK$/ do
  wait_for_elements_do_not_exist("UIImageView id:'loader_animation.png'")
   touch("label marked:'OK'")
 end
 
 And /^I goto Prepaid Card screen$/ do 
   wait_for_element_exists("button marked:'MORE >'")
   touch("button marked:'MORE >'")
 end
 
 And /^I tap on xponent reward button$/ do
   wait_for_elements_do_not_exist("UIView id:'loader_animation.png'")
   #wait_for_element_exists("button marked:'btn fuelrewards press'")
   touch("button marked:'btn fuelrewards press'")
 end
 
 Then /^I should see xponent rewards details$/ do
   
   wait_for_element_exists("label marked:'Xponent Reward Details'")
   expect(element_exists("label marked:'Xponent Reward Details'")).to eq true
 end
 
 And /^I tap on support$/ do
   wait_for_elements_do_not_exist("UIView id:'loader_animation.png'")
   touch("button marked:'Support'")
 end
 
 Then /^I should see support screen$/ do
   wait_for_element_exists("label marked:'FAQ'")
   expect(element_exists("label marked:'FAQ'")).to eq true
 end
 And /^I tap on reset pin$/ do
   wait_for_elements_do_not_exist("UIView id:'loader_animation.png'")
   touch("button marked:'Reset Pin'")
 end
 
 Then /^I should see reset pin screen$/ do
   wait_for_element_exists("label marked:'Reset Pin'")
   expect(element_exists("label marked:'Reset Pin'")).to eq true
 end
 
 And /^I tap on view merchant offer$/ do
   wait_for_elements_do_not_exist("UIView id:'loader_animation.png'")
   touch("button marked:'VIEW MERCHANT OFFERS'")
 end
 
 Then /^I should see merchant offer screen$/ do
   wait_for_element_exists("label marked:'Merchant Offers'")
   expect(element_exists("label marked:'Merchant Offers'")).to eq true
 end
 
 Then(/^I should see button to view activity$/) do
   wait_for_elements_do_not_exist("UIView id:'loader_animation.png'")
    expect(element_exists("button marked:'VIEW ACTIVITY'")).to eq true
 end

 Then(/^I tap on button view activity$/) do
  touch("button marked:'VIEW ACTIVITY'")
 end

 Then(/^I should see card activity screen$/) do
   wait_for_elements_do_not_exist("UIView id:'loader_animation.png'")
   expect(element_exists("UITableViewCellContentView")).to eq true
 end

Then /^I should see error message for amount$/ do
  expect(element_exists("label marked:'Error'")).to eq true
  expect(element_exists("label marked:'Amount must be greater than 0'")).to eq true
  expect(element_exists("label marked:'OK'")).to eq true
  
end

And /^I close the error modal$/ do
  touch("label marked:'OK'")
  wait_for_elements_do_not_exist("label marked:'Error'")
  expect(element_exists("label marked:'Error'")).to eq false
end

=begin
 And I should see option to add amount manually
 
 
 Then I should asked for password
 And I specify the password and tap on OK
 And I should see toss message success
=end