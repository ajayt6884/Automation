require 'calabash-cucumber/calabash_steps'

Given /^I am on Dashboard$/ do
  
end

Given /^I am on the Welcome Screen$/ do
  element_exists("view")
  sleep(STEP_PAUSE)
end

Then /^I should see chevron and apple icon$/ do
  expect(query("imageView").first['id']).to eq('img_chevron_applepay')
end

When /^I tap on close button$/ do
  touch("button marked:'btn x gry up'")
end

Then /^I should see button with text "(.*?)"$/ do |btn_label|
  element_exists("button marked:'#{btn_label}'")
  element_exists("label marked:'#{btn_label}'")
end

And /^I should see button settings$/ do
  element_exists("button marked:'icon setting active gry'")
end

#===new
And /^I should see settings icon$/ do
  element_exists("button marked:'icon setting active gry'")
end
#========
=begin
Given(/^I am on home page$/)do 
  sleep(2)
  if !query("ButtonLabel view marked:'Ok'").empty?
    touch("ButtonLabel view marked:'Ok'")
  elsif !query("ButtonLabel view marked:'OK'").empty?
    touch("ButtonLabel view marked:'OK'")
  end
  sleep(2)
end
=end

Then /^I tap on Route Planner text$/ do
  
  wait_for(:timeout => wait_time){element_exists("button marked:'Route Planner'")}
  p query("button marked:'Route Planner'")
  touch("button marked:'Route Planner'")
  wait_for(:timeout => wait_time){element_exists("button marked:'btn nav menu up'")}
  
end

When /^I tap on Credit Card$/ do
  wait_for(:timeout => wait_time){element_exists("button marked:'Credit Card'")}
  touch("button marked:'Credit Card'")
  wait_for(:timeout => wait_time){element_exists("button marked:'btn nav menu up'")}
end

When /^I tap on Settings icon$/ do
 touch("button marked:'icon setting active gry'")
 wait_for(:timeout => wait_time){element_exists("label marked:'Show me both Chevron and Texaco station results'")}
end

And /^I touch DONE$/ do
  touch("button marked:'btn done'")
end

And /^I tap on Menu Button$/ do
  wait_for_element_exists("button marked:'btn nav menu up'")
  touch("button marked:'btn nav menu up'")
end

Then /^I should see Menu Button in header$/ do
  wait_for(:timeout => wait_time){element_exists("view marked:'btn nav menu up'")}
  element_exists("view marked:'btn nav menu up'")
end

=begin
And /^I should see "(.*?)" in header$/ do |text|
  wait_for(:timeout => wait_time){element_exists("label marked:'#{text}'")}
  element_exists("label marked:'#{text}'")
end
=end
Then /^I should see the Filter Button in header$/ do 
  element_exists("button marked:'btn nav filter up'")
end

And /^I tap on left arrow$/ do
  touch("button marked:'arrow left'")
end

