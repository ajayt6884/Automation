Given(/^i am on home page$/) do
  visit "https://staging.dealdey.com"
  find(:xpath, "//*[@id='new_city_select']/a").click
end

Given(/^I select a category city & travel from the top$/) do
  find(:xpath, "//*[@id='city-travel']/a/span/span").click
end

When(/^I select an deal from the city & travel page$/) do
  find(:xpath, "//*[@id='deal_3693']/div[1]/div[2]/a").click
end

Then(/^i should redirect to deal detail page$/) do
  confirm = find(:xpath, "//*[@id='deal-details-container']/div/h1/span")
  confirm.text.include?("erp disabled new deal")
end

When(/^I add the deal to my cart$/) do
  find("option[value='169']").click
  page.execute_script "window.scrollBy(0,-10000)"
  click_on('Buy!')
end

Then(/^I should see the deal in my cart$/) do
  confirm = find(:xpath, "//*[@id='flash']/div/p")
  confirm.text.include?("successfully added to your cart")
end


Then(/^I click on continue shopping button$/) do
  click_on("Continue shopping")
end

Then(/^see the deal detail page again$/) do
  confirm = find(:xpath, "//*[@id='deal-details-container']/div/h1/span")
  confirm.text.include?("erp disabled new deal")
end

Then(/^click on Fashion category$/) do
  find(:xpath, "//*[@id='fashion']/a/span/span").click
end

Then(/^agian select the deal from page$/) do
  find(:xpath, "//*[@id='deal_4392']/div[1]/div/a/img").click
end

Then(/^I should redirect to deal detail page$/) do
  confirm = find(:xpath, "//*[@id='deal-details-container']/div/h1/span")
  confirm.text.include?("Variant Deal")
end

When(/^i click on buy button$/) do
  find("option[value='183']").click
  page.execute_script "window.scrollBy(0,-10000)"
  click_on('Buy!')
end

Then(/^deal is added to my cart and i m able to see it$/) do
  confirm = find(:xpath, "//*[@id='flash']/div/p")
  confirm.text.include?("successfully added to your cart")
end
