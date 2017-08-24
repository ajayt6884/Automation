Then(/^I specify start location San Francisco$/) do
  #Wait for input field to be displayed
  wait_for_elements_exist("UITextField index:0")
  #touch("UITextField text:'Start Location'")
  touch("UITextField index:0")
  #clear the input field if any text present
  clear_text("UITextField index:0")
  keyboard_enter_text('San Francisco')
  touch("label marked:'San Francisco, CA'")
end

Then(/^I specify end location San Ramon$/) do
  #touch("UITextField text:'Start Location'")
  touch("UITextField index:1")
  #clear the input field if any text present
  clear_text("UITextField index:1")
  keyboard_enter_text('San Ramon')
  touch("label marked:'San Ramon, CA'")
end

Then(/^I should see stations count in route$/) do
  #wait_for_none_animating
  wait_for_elements_do_not_exist("UIImageView id:'loader_animation.png'")
  wait_for_element_exists("label marked:'45 Stations • 39 Min • 34.1 Mi'")
  expect(query('label')[3]['label'].to_i).to eq 45
end




#=================
And(/^I should see "(.*)" location field$/) do |field|
  input_field = data_for("route_planner_input")["#{field.downcase}".to_sym]
  element_exists("* id:'#{input_field}'")
end

And(/^I should see from and destination icon$/) do 
  #data_for("route_planner_images")[:from_and_destination_images].each do |icon|
    element_exists("view id:'marker_from.png'")
    element_exists("view id:'marker_destination.png'")
  
end

And(/^I should see bottom cell$/) do
  #wait_for_transition
  wait_for_none_animating
  element_exists("label index:3")
end

When(/^I tap on bottom cell$/) do 
  touch("label index:3")
  #wait_for_transition
end

And /^I should see tab Stations$/ do
   wait_for_elements_exist("button marked:'tab StationsInactive'")
  expect(element_exists("button marked:'tab StationsInactive'")).to eq true
end

And /^I should see tab Stations Added$/ do
  expect(element_exists("button marked:'tab StationsAddedInactive'")).to eq true
end
  
And(/^I should see ADD TO ROUTE button$/) do
  wait_for_elements_exist("UITableViewCellContentView index:0 button")
 expect(element_exists("UITableViewCellContentView index:0 button")).to eq true
end

Given(/^I am on stations listing$/) do
  steps %{
    When I enter "San Francisco" in "start" location
    And I enter "Los Angeles" in "end" location
    Then I should see loader
    When I tap on bottom cell
  }
end

Given(/^I am on added stations listing$/) do 
  steps %{
    Given I am on stations listing
    When I tap on add to route
    Then I should see loader
    Then I touch the "Stations Added" text
  }
end

When(/^I tap on add to route$/) do 
  wait_for_elements_exist("UITableViewCellContentView index:0 button")
  touch("UITableViewCellContentView index:0 button")
  sleep(5)
end

Then(/^I wait for results$/) do 
  wait_for(:timeout => wait_time){element_exists("label index:3")}
end

And(/^I should see added stations count$/) do 
  expect(element_exists("label marked:'1' index:0")).to eq true
end

Then(/^I should see added stations list$/) do 
  wait_for(:timeout => wait_time) {element_exists("UITableViewCellContentView")}
  steps %{
    And I should see station list
    And I should see remove button
  }
end

And(/^I should see remove button$/) do 
  element_exists("UITableViewCellContentView index:0 button")
end

And(/^I tap remove button$/) do
  touch("UITableViewCellContentView index:0 button")
  sleep(5)
end

When(/^I tap on stations added$/) do 
  steps %{Then I touch the "tab StationsAddedInactive" button}
  sleep(5)
end

