timestamp = Time.parse(Time.now.to_s)
time = 3600* timestamp.hour + 60 * timestamp.min + timestamp.sec

Given(/^i am on user signup page$/) do
  visit "https://staging.dealdey.com"
  find(:xpath, "//*[@id='new_city_select']/a").click
  find(:xpath, "//*[@id='header']/div[2]/div[3]/ul/li[3]/a").click
end

When(/^I submit valid data in every field$/) do
  fill_in('user[firstname]', :with => 'ajay')
  fill_in('user[email]', :with => "ajay.thakur#{time}@vinsol.com")
  fill_in('user[password]', :with => 'qwerty')
  fill_in('user[password_confirmation]', :with => 'qwerty')
  fill_in('user[mobile]', :with => '09876543216')
  find("option[value='17']").click
  click_on('Register')
end

Then(/^i will see the success message$/) do
  find(:xpath, "/html/body/div[4]/div[1]/a").click
  confirm = find(:xpath,'/html/body/div[1]/div[3]/div[2]/div/p')
  confirm.text.include?("You have signed up successfully.")
end

When(/^I submit "([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5|
  fill_in('user[firstname]', :with => "#{arg1}")
  fill_in('user[email]', :with => "#{arg2}")
  fill_in('user[password]', :with => "#{arg3}")
  fill_in('user[password_confirmation]', :with => "#{arg4}")
  fill_in('user[mobile]', :with => "#{arg5}")
  click_on('Register')
end

Then(/^I should be displayed error message "([^"]*)" for field "([^"]*)"$/) do |msg, field|
  if "#{field}" == "confirm_password"
    expect(find(:xpath, "//*[@id='new_user']/li[1]/dl/dd[4]/span/p").text).to eq ("#{msg}")

  elsif "#{field}" == "email"
    expect(find(:xpath, "//*[@id='new_user']/li[1]/dl/dd[2]/span[2]/p").text).to eq ("#{msg}")

  else "#{field}" == "mobile"
    expect(find(:xpath, "//*[@id='new_user']/li[1]/dl/dd[5]/span[2]/p").text).to eq ("#{msg}")
  end
end
