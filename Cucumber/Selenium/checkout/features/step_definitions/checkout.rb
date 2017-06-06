Given(/^i am on the home page$/) do
  @driver.navigate.to "https://staging.dealdey.com"
  @driver.find_element(:class, "no-subscription").click
end

Given(/^signin$/) do
  @driver.find_element(:class,'signin').click
  @driver.find_element(:id, 'sign_in_email').send_keys "ajay.thakur@vinsol.com"
  @driver.find_element(:id, 'sign_in_password').send_keys "jaythakur1"
  @driver.find_element(:id,'signin-btn').click
  sleep(5)
end

Given(/^add the item to the cart$/) do
 # @driver.execute_script("window.scrollBy(0, -250);")
  @driver.find_element(:class, 'cat-name').click
  #sleep(5)
  @driver.execute_script("window.scrollBy(0,250);")
  @driver.find_element(:xpath, "//*[@id='deal_3693']/div[1]/div[2]").click
  #@driver.find_element(:xpath, "//*[@id='deal_4392']/div[1]/div")
  #element.click
  p 'i m here'
  @driver.find_element(:class,'option-type-box').click
    dropdown = @driver.find_element(:class, 'option-type-box')
    option = Selenium::WebDriver::Support::Select.new(dropdown)
    option.select_by(:value, '169')
    @driver.execute_script("window.scrollBy(0, -350);")
  @driver.find_element(:class,'button').click
  confirm = @driver.find_element(:xpath, '//*[@id="flash"]/div')
  confirm.text.include?("successfully added to your cart")
end

When(/^I click on the proceed button$/) do
  @driver.find_element(:xpath, '//*[@id="user_cart"]/div[3]/div[2]/div[3]/table/tbody/tr/td[2]/div/form/div/input[1]').click
  sleep(5)
end

Then(/^add the shipping address and again click on the proceed button$/) do
  @driver.find_element(:xpath, '//*[@id="user_cart"]/div[4]/div[2]/div/table/tbody/tr/td[2]/a').click
  sleep(5)
end

Then(/^I click on the pay button$/) do
  @driver.find_element(:xpath, '//*[@id="wallet-complete-order"]').click
  sleep(5)
end

Then(/^order is complete successfully$/) do
  confirm = @driver.find_element(:xpath, '//*[@id="wrapper"]/div[3]/div[3]/div/h6')
  confirm.text.include?("Thanks for shopping on DealDey!")
end
