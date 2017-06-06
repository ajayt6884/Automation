Given(/^i am on Philanthropy Form page$/) do
  @home = HomePhilanthrophy.new
  @home.load
end

When(/^i accept the term and condition check-box$/) do
  Capybara.execute_script "window.scrollBy(0,1000)"
  @user = PhilanthrophyForm.new
  @user.checkbox.click
  @user.continue_button.click
end

Then(/^i can see the second step of the form$/) do
  @user.confirmation_text
end

When(/^i enter the vlaue in every field of the form$/) do
  @user.country.click
  @user.state.click
  @user.city.click
  @user.restaurant.click
  @user.identification_info('test', 'test', 'vinsol')
  @user.organization_type.click
  @user.contact_info('test@test.com', '0987654321')
  @user.address_info('221 baker street', 'qwerty', '54321')
  @user.date_info((DateTime.now+42).strftime('%m-%d-%Y'))
  @user.message_info('Test form. Please ignore it.')
  #attach_file('file_field-220', File.absolute_path('C:\Users\A.J\Documents/p.txt'))

end


When(/^click on submit button$/) do
  page.execute_script "window.scrollBy(0,400)"
  @user.submit.click
  #sleep(2)
end

Then(/^the form submitted successfully$/) do
  @user.confirmation_message
end