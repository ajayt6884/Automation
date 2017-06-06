Given(/^i am on user signin page$/) do
  @driver.navigate.to "https://staging.dealdey.com"
  @driver.find_element(:class, "no-subscription").click
  @driver.find_element(:class,'signin').click
end

When(/^I submit valid data in every field$/) do
  @driver.find_element(:id, 'sign_in_email').send_keys "ajay.thakur@vinsol.com"
  @driver.find_element(:id, 'sign_in_password').send_keys "jaythakur1"
  @driver.find_element(:id,'signin-btn').click
end

When(/^I submit "([^"]*)","([^"]*)"$/) do |arg1, arg2|
  @driver.find_element(:id, 'sign_in_email').send_keys "#{arg1}"
  @driver.find_element(:id, 'sign_in_password').send_keys "#{arg2}"
  @driver.find_element(:id,'signin-btn').click
end

Then(/^I should be displayed error message "([^"]*)" for field "([^"]*)"$/) do |msg, field|
  if "#{field}" == "email"
      @wait.until do
        element = @driver.find_elements(:class, "spinner_ajax")
      end
      sleep(5)
      #  @wait.until do
      #  element = @driver.find_element(:class, "spinner_ajax").size == 0
      # end
      #sleep(15)
      u = @driver.find_elements(:xpath, "//*[@id='flash']/div/p")
       expect(u[1].text).to eq ("#{msg}")

  else "#{field}" == "password"
    @wait.until do
      element = @driver.find_elements(:class, "spinner_ajax")
    end
    sleep(5)
    # @wait.until do
    #    element = @driver.find_element(:class, "spinner_ajax").size == 0
    #   end
    # sleep(15)
     u = @driver.find_elements(:xpath, "//*[@id='flash']/div/p")
      expect(u[1].text).to eq ("#{msg}")
   # expect(@driver.find_element(:xpath, "//*[@id='flash']/div/p").text).to eq ("#{msg}")
  end
end
