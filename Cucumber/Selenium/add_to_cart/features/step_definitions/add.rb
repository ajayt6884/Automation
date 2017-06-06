Given(/^i am on home page$/) do
  @driver.navigate.to "https://staging.dealdey.com"
  @driver.find_element(:class, "no-subscription").click
end


Given(/^I select a category city & travel from the top$/) do
  @driver.find_element(:class,'cat-name').click
end

When(/^I select an deal from the city & travel page$/) do
  element = @driver.find_element(:class, "image")
  element.click
end

When(/^I add the deal to my cart$/) do
  @driver.find_element(:class,'option-type-box').click
    dropdown = @driver.find_element(:class, 'option-type-box')
    option = Selenium::WebDriver::Support::Select.new(dropdown)
    option.select_by(:value, '169')
    @driver.execute_script("window.scrollBy(0, -350);")
  @driver.find_element(:class,'button').click
end

Then(/^I should see the deal in my cart$/) do
  confirm = @driver.find_element(:xpath,'//*[@id="flash"]/div')
  confirm.text.include?("successfully added to your cart")
end



