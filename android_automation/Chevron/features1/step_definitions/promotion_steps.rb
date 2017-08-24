When /^I tap on Promotions$/ do
  touch("button marked:'Promotions'")
end
 
Then /^I should see promotions list or no promotion list$/ do
  wait_for_elements_exist("label marked:'Promotions'")
  wait_for_elements_exist("button marked:'btn nav menu up'")
  elem =  query("label marked:'Featured Promotions'")
  if elem.empty?
    element_exists("label marked:'Sorry, we don\\'t have any promotions available in your area.'")
  end
end
 
Then /^I should see featured promotions list$/ do
  wait_for_none_animating
  wait_for(:timeout => wait_time){element_exists("label marked:'Featured Promotions'")}
  elem =  query("label marked:'Featured Promotions'")
  if !elem.empty?
    steps %{Then I should see "Featured Promotions"}
    wait_for(:timeout => wait_time){element_exists("label marked:'Save at the Pump'")}
    
    wait_for(:timeout => wait_time){element_exists("label marked:'5-Hour Energy Shot'")}
  end  
end

And /^I should see extramile promotions list$/ do
  wait_for(:timeout => wait_time){element_exists("label marked:'ExtraMile Promotions'")}
  elem2 =  query("label marked:'ExtraMile Promotions'")
  if !elem2.empty?
    steps %{Then I should see "ExtraMile Promotions"}
    wait_for(:timeout => wait_time){element_exists("label marked:'Muscle Milk'")}
    wait_for(:timeout => wait_time){element_exists("label marked:'Hot Food Mix & Match'")}
  end
end

And /^I touch text "(.*?)"$/ do |text|
  wait_for_elements_exist("view marked:'#{text}'")
  touch("view marked:'#{text}'")
end
  
And /^I should see text "(.*?)"$/ do |text|
  #Not a good approach
 expect(query("textView").first['value']).to eq(text)
end
Then /^I should see offer details content$/ do
  expect(query("textView").last['value']).to include('Chevron Intellectual Property')
end

Then /^I close the offer detail popup$/ do
  touch("button marked:'btn x gry up'")
end

And /^featured promotion detail section closed$/ do
   wait_for_elements_do_not_exist("button marked:'Sign Up For A Rewards Card'")
   expect(element_exists("button marked:'Sign Up For A Rewards Card'")).to eq false
end

And /^promotion detail offer should get close$/ do
  wait_for_elements_do_not_exist("button marked:'Details'")
  expect(element_exists("button marked:'Details'")).to eq false
end

Then /^I should see "(.*?)" button$/ do |btn_label|
  element_exists("label marked:'#{btn_label}'")
end

Then /^I should see web view$/ do
  wait_for(:timeout => wait_time){element_exists("UIWebView")}
  expect(element_exists("UIWebView")).to eq true
  expect(element_exists("window")).to eq true
end 

And /^I should see location alert$/ do
  expect(uia_query(:alert).count > 0).to eq true
end

And /^I tap OK on location alert$/ do
  uia_tap_mark 'OK'
end

Then(/^I should see promotions list or No promotions available message$/) do
  expect(element_exists("label marked:'Featured Promotions'")).to eq true
  expect(element_exists("label marked:'ExtraMile Promotions'")).to eq true
  #no check for message
end
=begin

Then(/^I should see promotions list or No promotions available message$/) do
  elem =  query("label marked:'Featured Promotions'")
  elem2 =  query("label marked:'ExtraMile Promotions'")
  if !elem.empty?
    steps %{Then I should see "Featured Promotions"}
    wait_for(:timeout => wait_time){element_exists("label marked:'Save at the Pump'")}
    wait_for(:timeout => wait_time){element_exists("label marked:'5-Hour Energy Shot'")}
  elsif !elem2.empty?
    steps %{Then I should see "ExtraMile Promotions"}
    wait_for(:timeout => wait_time){element_exists("label marked:'Muscle Milk'")}
    wait_for(:timeout => wait_time){element_exists("label marked:'Hot Food Mix & Match'")}
  else
    steps %{Then I should see "Sorry,we don't have any promotions available in your area."}
  end
end



Then(/^I should see promotions list or No promotions available message$/) do
  sleep(5)
  elem =  query("label text:'Featured Promotions'")
  elem2 =  query("label text:'ExtraMile Promotions'")
  if !elem.empty?
    steps %{Then I should see "Featured Promotions"}
  elsif !elem2.empty?
    steps %{Then I should see "ExtraMile Promotions"}
  else
    steps %{Then I should see "Sorry,we don't have any promotions available in your area."}
  end
end

Then(/^I should see promotions list$/) do 
  begin
    wait_for(:timeout => wait_time){element_exists("label marked:'ExtraMile Promotions'")} 
    wait_for(:timeout => wait_time){element_exists("label marked:'Featured Promotions'")} 
  rescue Exception => e 
    puts e.message
    steps %{Then take picture}
    raise "No promotions available, to execute further steps..............."
  end
end

Then(/^I tap on promotion$/) do 
  wait_for(:timeout => wait_time){element_exists("TableViewCellContentView index:0 label")} 
  touch("TableViewCellContentView index:0 label index:0")
  wait_for(:timeout => wait_time){element_exists("button index:1")}
end

And(/^I should see details button$/) do 
  check_element_exists("button index:1")
end

And(/^I tap on details button$/) do 
  touch("button index:1")
end

Then(/^I should see Detail popup$/) do 
  steps %{And I wait to see "btn x gry up"}
end

Then(/^I close the detail popup$/) do 
  touch("button index:0")
end

When(/^I disable use my location for promotions$/) do 
  steps %{
    When I tap on "Settings" text
    When I "disable" the "use my location for promotions"
    And I tap on "YES" for settings
    And I tap on Menu Button 
  }
=end
