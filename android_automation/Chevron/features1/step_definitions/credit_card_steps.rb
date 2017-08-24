When /^I tap on APPLY TODAY button$/ do
  touch("button marked:'btn CreditCard apply'")
end

Then(/^I should be redirected to credit card "(.*)" page$/) do |page|
  wait_for_none_animating
  #wait_for(:timeout => wait_time) {element_exists("webView css:'*'")}
  expect(element_exists("label marked:'#{page}")).to eq true
  #check_element_exists("webView css:'*'")
  #check_element_exists("label marked:'#{page}'")
end

And /^I should see text Credit Cards$/ do
  wait_for_none_animating
  expect(element_exists("label marked:'Credit Cards'")).to eq true
end

When /^I tap on LOGIN button$/ do
  wait_for_none_animating
  wait_for_elements_exist("button marked:'btn CreditCard login'")
  sleep(2)
  touch("button marked:'btn CreditCard login'")
end

Then /^I tap on button LEARN MORE of credit cards$/ do
  wait_for_none_animating
  touch("button marked:'LEARN MORE >' index:1")
  wait_for_none_animating
end