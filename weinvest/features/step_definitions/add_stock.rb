Given("i am on modal-portfolio page") do
  visit "https://sfo-demo.herokuapp.com/model-portfolio"
end


When("I select All Weather Strategy") do
  page.execute_script "window.scrollBy(0,-10000)"
  find(:id, "btn-explore79").click
end

Then("click on Customize Portfolio button") do
  find(:xpath, "//*[@id='page-top']/div[3]/section/div[1]/div/div/div/div/div[2]/div[1]/div[1]/a").click
end

Then("I click on Customize button") do
  page.execute_script "window.scrollBy(0,-5000)"
  find(:xpath, "//*[@id='customise-portfolio']/div/div[2]/div/div[1]/div[3]/a").click
end


Then("click on +Add Stock button") do
  find(:xpath, "//*[@id='customise-portfoli']/div/div[2]/div/div[3]/div/div[1]/div[4]/div/a").click
end

Then("click on add stock button in BT Group plc") do
  page.execute_script "window.scrollBy(0,-5000)"
  find(:xpath, "//*[@id='modal-1']/div/div/div[2]/div/div/div[66]/div[4]/button").click
end

Then("click on Done") do
  find(:xpath, "//*[@id='modal-1']/div/div/div[3]/button").click
end

Then("Check whether BT Group plc is added to the portfolio") do
  page.execute_script "window.scrollBy(0,-3000)"
  confirm = find(:xpath, "//*[@id='customise-portfolio']/div/div[2]/div/div[3]/div/div[15]/div[3]/a")
  confirm.text.include?("BT Group plc")
end