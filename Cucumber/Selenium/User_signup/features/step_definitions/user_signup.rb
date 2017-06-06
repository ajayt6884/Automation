timestamp = Time.parse(Time.now.to_s)
time = 3600* timestamp.hour + 60 * timestamp.min + timestamp.sec

Given(/^i am on user signup page$/) do
  @driver.navigate.to "https://easyerrands.herokuapp.com/user/signup"
end

When(/^I submit valid data in every field$/) do
@driver.find_element(:name,'user[name]').send_keys "aman"
@driver.find_element(:name,'user[email]').send_keys "ayush+#{time}@vinsol.com"
@driver.find_element(:name,'user[password]').send_keys "qwerty"
@driver.find_element(:name,'user[password_confirmation]').send_keys "qwerty"
@driver.find_element(:name,'user[phone_number]').send_keys "9999999999"
@driver.find_element(:id,'user_address_attributes_address_line').send_keys "C/2"
dropdown = @driver.find_element(id: 'user_address_attributes_state_id')
  select_list = Selenium::WebDriver::Support::Select.new(dropdown)
  select_list.select_by(:value, '1')
drop = @driver.find_element(id: 'user_address_attributes_locality_id')
  select_l = Selenium::WebDriver::Support::Select.new(drop)
  select_l.select_by(:value, '1')
@driver.find_element(:name,'commit').click
end

Then(/^I should receive a message about mail$/) do
  @wait.until do
  element = @driver.find_element(:class, "alert-success")
  end
  expect(@driver.find_element(:class, "alert-success").text).to eq ("An email has been sent to your account, please follow the link to continue!")
end

When(/^I submit "([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)","blank$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8|
@driver.find_element(:name,'user[name]').send_keys "#{arg1}"
@driver.find_element(:name,'user[email]').send_keys "#{arg2}"
@driver.find_element(:name,'user[password]').send_keys "#{arg3}"
@driver.find_element(:name,'user[password_confirmation]').send_keys "#{arg4}"
@driver.find_element(:name,'user[phone_number]').send_keys "#{arg5}"
@driver.find_element(:id,'user_address_attributes_address_line').send_keys "#{arg6}"
dropdown = @driver.find_element(id: 'user_address_attributes_state_id')
  select_list = Selenium::WebDriver::Support::Select.new(dropdown)
  select_list.select_by(:text, "#{arg7}")
  if "#{arg8}" == ""
  else
      drop = @driver.find_element(id: 'user_address_attributes_locality_id')
      select_l = Selenium::WebDriver::Support::Select.new(drop)
      select_l.select_by(:text, "#{arg8}")
    end
  @driver.find_element(:name,'commit').click
end

Then(/^I should be displayed error message "([^"]*)" for field "([^"]*)"$/) do |msg, field|
  if "#{field}" == "email"
    @wait.until do
      element = @driver.find_element(:class, 'col-xs-5')
    end
    expect(@driver.find_element(:xpath, "//*[@id='new_user']/div[2]/div/div/span").text).to eq ("#{msg}")

  elsif "#{field}" == "confirm_password"
    @wait.until do
      element = @driver.find_element(:class, 'col-xs-5')
    end
     expect(@driver.find_element(:css, "#new_user > div:nth-child(6) > div > div > span").text).to eq ("#{msg}")

  elsif "#{field}" == "phone_number"
    @wait.until do
      element = @driver.find_element(:xpath, "//*[@id='new_user']/div[5]/div/div")
    end
    expect(@driver.find_element(:xpath, "//*[@id='new_user']/div[5]/div/div/span").text).to eq ("#{msg}")

  elsif "#{field}" == "address"
     @wait.until do
      element = @driver.find_element(:xpath, "//*[@id='new_user']/div[6]/div/div")
    end
    expect(@driver.find_element(:xpath, "//*[@id='new_user']/div[6]/div/div/span").text).to eq ("#{msg}")

  else "#{field}" == "location"
    @wait.until do
      element = @driver.find_element(:xpath, "//*[@id='new_user']/div[8]/div/div")
    end
    expect(@driver.find_element(:xpath, "//*[@id='new_user']/div[8]/div/div/span").text).to eq ("#{msg}")
  end
end



