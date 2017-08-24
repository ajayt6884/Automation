Given /^app launches successfully$/ do
  #Nothing
end

Then /^I should see apple pay screen$/ do
  wait_for_none_animating
  expect(element_exists("label marked:'No wallet? No worries. Apple Pay is here.'")).to eq true
  expect(element_exists("button marked:'btn findstations'")).to eq true
  expect(element_exists("button marked:'btn x gry up'")).to eq true
  
end

Then /^I close the screen$/ do
  touch("button marked:'btn x gry up'")
end

And /^I am on dashboard$/ do
  steps %{
    Then I should see "Stations Near Me"
    Then I should see "Route Planner"
    Then I should see "Promotions"
    Then I should see "Chevron Cards"
    Then I should see "Inbox"
    Then I should see "Stations    Near Address"
    And I should see settings icon  

  }
end

Given /^I am on the Welcome Screen$/ do
  element_exists("view")
  sleep(STEP_PAUSE)
end

Then /^I should see button with text "(.*?)"$/ do |btn_label|
  check_element_exists("button marked:'#{btn_label}'")
  check_element_exists("label marked:'#{btn_label}'")
end

And /^I should see button settings$/ do
  check_element_exists("button marked:'icon setting active gry'")
end

#========
