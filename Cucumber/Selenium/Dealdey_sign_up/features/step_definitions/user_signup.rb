class String
  def generate_email
    'ajay.thakur'+(0..9).to_a.sample.to_s+'@vinsol.com'
  end
end

v = String.new

Given(/^i am on user signup page$/) do
  @driver.navigate.to "https://staging.dealdey.com"
  @driver.find_element(:class, "no-subscription").click
  @driver.find_element(:class,'signup').click
end

When(/^I submit valid data in every field$/) do
  @driver.find_element(:name, 'user[firstname]').send_keys "ajay"
  @driver.find_element(:id, 'user_email').send_keys v.generate_email
  @driver.find_element(:id, 'user_password').send_keys "qwerty"
  @driver.find_element(:id, 'user_password_confirmation').send_keys "qwerty"
  @driver.find_element(:id, 'user_mobile').send_keys "09999999992"
  @driver.find_element(:class, 'email_subscription_state').click
    dropdown = @driver.find_element(:class, 'email_subscription_state')
    option = Selenium::WebDriver::Support::Select.new(dropdown)
    option.select_by(:value, '17')
  @driver.find_element(:id,'signup-btn').click
end


When(/^I submit "([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5|
  @driver.find_element(:name, 'user[firstname]').send_keys "#{arg1}"
  @driver.find_element(:id, 'user_email').send_keys "#{arg2}"
  @driver.find_element(:id, 'user_password').send_keys "#{arg3}"
  @driver.find_element(:id, 'user_password_confirmation').send_keys "#{arg4}"
  @driver.find_element(:id, 'user_mobile').send_keys "#{arg5}"
  @driver.find_element(:id,'signup-btn').click
end

Then(/^I should be displayed error message "([^"]*)" for field "([^"]*)"$/) do |msg, field|
# element1 = @driver.find_elements(:class, "errorMsg")
# print "==============================================================================="
# print element1.length
# for i in (0..element1.length)
#   p element1[i]
# end
# print "==============================================================================="
  if "#{field}" == "confirm_password"
    @wait.until do
      element = @driver.find_element(:class, "form-input")
    end
     expect(@driver.find_element(:xpath, "//*[@id='new_user']/li[1]/dl/dd[4]/span/p").text).to eq ("#{msg}")

  elsif "#{field}" == "email"
    @wait.until do
      element = @driver.find_element(:class, "errorMsg")
    end
    sleep(5)
    expect(@driver.find_element(:class, "errorMsg").text).to eq ("#{msg}")


  else "#{field}" == "mobile"
    @wait.until do
      element = @driver.find_element(:class, "form-input")
    end
    expect(@driver.find_element(:xpath, "//*[@id='new_user']/li[1]/dl/dd[5]/span[2]/p").text).to eq ("#{msg}")
  end
end
