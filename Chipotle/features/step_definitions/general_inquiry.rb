Given(/^i am on General Inquiry Form page$/) do
  @home = Home.new
  @home.load
end

When(/^I submit valid data in every field of form$/) do
  @user = GeneralInquiryForm.new
  @user.radio_button.click
  @user.form_submission_with('test', 'test', 'test@test.com', '0987654321', 'Test form. Please ignore it.')
end

And(/^click on the submit button$/) do
  Capybara.execute_script "window.scrollBy(0,400)"
  @user.submit.click
end

Then(/^form submit successfully$/) do
  @user.confirmation_message
end