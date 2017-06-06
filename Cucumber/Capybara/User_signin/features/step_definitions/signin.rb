Given(/^i am on user signin page$/) do
  visit "https://staging.dealdey.com"
  find(:xpath, "//*[@id='new_city_select']/a").click
  find(:xpath, "//*[@id='header']/div[2]/div[3]/ul/li[1]/a").click
end

When(/^I submit valid data in every field$/) do
  fill_in('user[email]', :with => "ajay.thakur@vinsol.com")
  fill_in('user[password]', :with => 'jaythakur1')
  click_on('Sign in')
end

Then(/^i will see the success message$/) do
  confirm = find(:xpath, '//*[@id="flash"]/div/p')
  confirm.text.include?("Signed in successfully.")
end

When(/^I submit "([^"]*)","([^"]*)"$/) do |arg1, arg2|
  fill_in('user[email]', :with => "#{arg1}")
  fill_in('user[password]', :with => "#{arg2}")
  click_on('Sign in')
end

Then(/^I should be displayed error message "([^"]*)" for field "([^"]*)"$/) do |msg, field|
  if "#{field}" == "email"
    expect(find(:xpath, "//*[@id='flash']/div/p").text).to eq ("#{msg}")
  else "#{field}" == "password"
    expect(find(:xpath, "//*[@id='flash']/div/p").text).to eq ("#{msg}")
  end
end
