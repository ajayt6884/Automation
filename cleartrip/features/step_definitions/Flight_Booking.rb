Given("i am on home page") do
  visit "https://www.cleartrip.com/"
end

When("I entered keyword in the From field") do
  fill_in('id="FromTag"', :with => 'Bangalore')
  find(:xpath, "//*[@id='ui-id-30']").click
end

Then("I entered keyword in the TO field") do
  fill_in('id="ToTag"', :with => 'Delhi')
  find(:xpath, "//*[@id='ui-id-50']").click
end

Then("I select the date") do
  find(:xpath, "//*[@id='DepartDate']").set Date.today.strftime('%d-%m-%y')
end

Then("click on Search button") do
  find(:xpath, "//*[@id='SearchBtn']").click
end

Then("verify that the search result page contain the searchSummary keyword") do
  confirm = find(:xpath, "//*[@id='GlobalNav']/div/div[2]/div")
  confirm.text.include?("Bangalore → New Delhi")
end