Given("i am on hotel booking page") do
  visit "https://www.cleartrip.com/hotels"
end

When("I entered keyword in the where field") do
  fill_in('title="Where do you want to go"', :with => 'Indiranagar, Bangalore')
  find(:xpath, "//*[@id='ui-id-13']").click
end

Then("I select the checkin date") do
  find(:xpath, "//*[@id='DepartDate']").set Date.today.strftime('%d-%m-%y')
end

Then("I select the checkout date") do
  find(:xpath, "//*[@id='DepartDate']").set Date.today.next.strftime('%d-%m-%y')
end

Then("click on search button") do
  find(:xpath, "//*[@id='SearchHotelsButton']").click
end

