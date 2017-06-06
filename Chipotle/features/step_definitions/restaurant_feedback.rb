Given(/^i am on Restaurant Feedback Form page$/) do
  @home = Home.new
  @home.load
end

When(/^I submit valid data in every field$/) do

	@form = ResturantFeedbackForm.new
  @form.country.click
  @form.state.click
  @form.city.click
  @form.restaurant.click
  @form.date.set DateTime.now.strftime('%m-%d-%Y')
  @form.hour.click
  @form.minutes.click
  @form.meridiemm.click
  @form.form_submission_with('test', 'test', 'test@test.com','0987654321','Lorem Ipsum Dollar Sit')
  Capybara.execute_script "window.scrollBy(0,300)"
  #@form.find('#file_field-9218', visible: false).set ('C:\Users\A.J\Downloads\_0006_PintoBeans2.png')
end

Then(/^I click on the submit button$/) do
  @form.submit.click
end

Then(/^the form submit successfully$/) do
  @form.confirmation_message
end