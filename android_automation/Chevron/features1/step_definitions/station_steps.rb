
Then /^I tap on button "(.*?)"$/ do |label|
  touch("label marked:'#{label}'")  
end

And /^I wait for "(.*?)" screen$/ do |label|
  if label == "Stations Near Me" || label == "Stations    Near Address"
    #If location service alert present, then close it by tapping on "Ok"
    if element_exists("label marked:'Location Services Error'")
       #if uia_query(:alert).count > 0
       # dismiss by touching 'OK'
       uia_tap_mark 'Ok'
       return false
    end
  end
  if label == "Stations Near Me" || label == "Stations    Near Address"
   steps %{
     Then I wait for "Station Finder" to appear
   }   
 end
end

Then /^I should see deisel only filter$/ do
  expect(element_exists("label marked:'Diesel Only?'")).to eq true
  expect(element_exists("UIImageView id:'icon_diesel_wht.png'")).to eq true
end

And /^I select "(.*?)"$/ do |selection|
  if selection == "Yes"
    touch("button marked:'btn rnd YES'")
  elsif selection == "No"
    touch("button marked:'btn rnd NO'")
  end  
end  

And /^I select station "(.*?)"$/ do |station|
  touch("label marked:'#{station}'")
end

Then /^Diesel Filter should get selected$/ do
  
end

Then /^I should see station list or no station found message$/ do
  sleep(5) #To complete the animations
  stations = query("MNTableViewCell")
  if stations.empty?
    p "empty"
    wait_for_elements_exist("UILabel marked:'We couldn\\'t find any stations near this location.'")
  else
    p "station found"
    steps %{Then I should see station list}
  end
end

Then /^I search stations near "(.*?)"$/ do |search_loc|
  #To make the text field in edit mode
  touch("UITextField text:'Current Location'")
  # Clear input field 
  clear_text("UITextField text:'Current Location'")
  #and enter text
  steps %{
    Then I enter "#{search_loc}" into input field number 1
  }
  
  
end

Then(/^I should see station list$/) do 
  wait_for(:timeout => wait_time) {element_exists("UITableViewCellContentView")}
  expect(element_exists("UITableViewCellContentView index:0")).to eq true
  expect(element_exists("UITableViewCellContentView index:0 label")).to eq true
end



And /^station list should contain "(.*?)" at position "(.*?)"$/ do |station_address, pos|
  #Wait for station list to settle down
  wait_for_elements_exist("label marked:'   How Does Techron Help?'")
  expect(query("UITableViewCellContentView index:#{pos.to_i-1} label")[2]['text'] == station_address).to eq true
end

And /^I should see button "(.*?)"$/ do |label|
  wait_for(:timeout => wait_time) {element_exists("button marked:'   How Does Techron Help?'")}
end

When /^I touch the button "(.*?)"$/ do |label|
  query("button marked:'#{label}'")
  touch("button marked:'#{label}'")
end
Then /^I should see the techron popup$/ do
  expect(element_exists('UITextView')).to eq true
  expect(query('UITextView').first['text']).to include("Techron is a patented cleaning additive technology containing polyetheramine (PEA) chemistry.")
end

And /^I closed it$/ do
  wait_for(:timeout => wait_time) {element_exists("button marked:'btn x gry up'")}
  touch("button marked:'btn x gry up'")
  wait_for_elements_do_not_exist('UITextView')
  expect(element_exists('UITextView')).to eq false
end

And /^I select station at position "(.*?)"$/ do |pos|
  #Wait for station list to settle down
  wait_for_elements_exist("label marked:'   How Does Techron Help?'")
  @station_add = query("UITableViewCellContentView index:0 label")[2]['label']
  @station_city = query("UITableViewCellContentView index:0 label")[3]['label']
  @station_distance = query("UITableViewCellContentView index:0 label")[4]['label']
  #Tap on first staion in list
  touch("UITableViewCellContentView index:0")  
end


Then(/^I should view station details$/) do
  #To complete animations
  sleep(5)
  expect(query('label')[1]['label']).to eq(@station_add)
  expect(query('label')[2]['label']).to eq(@station_city)
  expect(query('label')[3]['label']).to eq(@station_distance)
end

Then(/^I go back to station list$/) do
  touch("button marked:'btn x gry up'")
  wait_for_elements_exist("label marked:'   How Does Techron Help?'")
end


#=======
And(/^I search the station with location "(.*)"$/) do |text|
  steps %{
    And I clear input field number 1
    And I enter "San Francisco" into input field number 1
    Then I wait to see "San Francisco, CA"
    And I select "San Francisco, CA"
    Then I wait for station list to appear
  }  
end

Then(/^I wait for station list to appear$/) do 
  sleep(5)
  wait_for(:timeout => wait_time){element_exists("TableViewCell index:0 label")}
end

And(/^I wait for diesel only bar and click no$/) do
  sleep(5) 
  #steps %{Then I wait for the view with id "station_list_item_collapsed" to appear}
  if !query("* id:'diesel_only_bar_layout'").empty?
    steps %{And I click "NO" for "diesel"}
  end
end


When(/^I apply "(.*)" filter$/) do |filter|
  label = data_for("station_filters")[filter.downcase.split.join("_").to_sym]
  steps %{Then I wait to see "#{label}"}
  touch("button marked:'#{label}'")
end

Then(/^I should see filtered stations$/) do
  sleep(10)
  stations = query("TableViewCell")
  if stations.empty?
    steps %{ Then I should see "We couldn't find any stations near this location."}
  else
    steps %{Then I should see station list}
  end
end

When(/^I tap on station cell$/) do 
  wait_for_elements_exist("UITableViewCellContentView index:0")
  touch("UITableViewCellContentView index:0")
  wait_for_none_animating
  #sleep(4)
end 

Then(/^I should see station detail$/) do 
  steps %{
    And I should see direction button in detail view
    And I should see add or remove to route button in detail view
  }
end

And(/^I should see add or remove to route button in detail view$/) do 
  add_btn = query("button marked:'btn AddRouteDetail'")
  if add_btn.empty?
    steps %{Then I wait to see "btn removeDetail"}
  else
    steps %{Then I wait to see "btn AddRouteDetail"}
  end
end

And(/^I close the station detail view$/) do 
  steps %{
    Then I wait to see "btn x gry up"
    Then I touch the "btn x gry up" button
  }
end

And(/^I should see direction button in detail view$/) do 
  steps %{Then I wait to see "btn directionsDetail"}
end




And(/^I should see direction button$/) do 
  steps %{Then I wait to see "btn round wht Directions"}
end

Then(/^I should see "(.*)" or station list$/) do |text|
  error_block = query("* id:'status_bar_text'").first
  if error_block.nil?
    steps %{Then I should see station list}
  else
    expect(error_block["text"]).to eq(text)
  end
end  

Then(/^I should see Techron modal text$/) do 
  steps %{
    Then I should see text ending with "How Does Techron Help?"
    Then I click How Does Techron Help
    And take picture
    And I close the Techron help popup
  }
end

And(/^I close the Techron help popup$/) do 
  steps %{Then I touch the "btn x gry up" button}
end

Then(/^I click How Does Techron Help$/) do 
  touch("ButtonLabel index:1")
  sleep(5)
end
=begin
And(/^I select "(.*)"$/) do |text|
  touch("* text:'#{text}'")
end
=end
Then(/^I should see detail view of station$/) do 
  steps %{
    And I wait to see "btn directionsLrg"
    Then I wait to see "btn x gry up"
  }
end

When(/^I press the Filter button$/) do 
  filter_button = query("view marked:'btn nav filter up'")
  if filter_button.empty?
    touch("view marked:'btn nav filter on'")
  else
    touch(filter_button)
  end
  wait_for(:timeout => wait_time){element_exists("TableViewCell")}
end

Then(/^I should see "(.*)" filter$/) do |filter|
  label = data_for("station_filters")[filter.downcase.split.join("_").to_sym]
  steps %{Then I wait to see "#{label}"}
end

Then(/^I wait for diesel only and tap NO$/) do 
  steps %{Then I wait to see "Diesel Only?"}
  sleep(5)
  options =  query("view id:'btn_rnd_NO.png'")
  if options.empty?
    touch("view marked:'btn rnd NO'")
  else
    touch("view id:'btn_rnd_NO.png'")
  end
end