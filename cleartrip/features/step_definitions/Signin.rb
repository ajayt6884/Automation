Given("i am on home page") do
  visit "https://www.cleartrip.com/"
end

When("I click on the Yourtrips button") do
  find(:xpath, "//*[@id='userAccountLink']/span[2]").click
end

Then("I click on the signin button") do
  find(:xpath, "//*[@id='SignIn']").click
end

Then("I click on the signin button on modal") do
  find(:xpath, "//*[@id='signInButton']").clicks
end

Then("verify the error message shown on the modal") do
  confirm = find(:xpath, "//*[@id='errors1']/span")
  confirm.text.include?("There were errors in your submission")
end
