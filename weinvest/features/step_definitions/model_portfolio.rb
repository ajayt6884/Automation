Given("i am on modal-portfolio page") do
  visit "https://sfo-demo.herokuapp.com/model-portfolio"
end

When("I select “All Weather Strategy”") do
  page.execute_script "window.scrollBy(0,-10000)"
  find(:id, "btn-explore79").click
end

Then("click on “Customize Portfolio” button") do
  find(:xpath, "//*[@id='page-top']/div[3]/section/div[1]/div/div/div/div/div[2]/div[1]/div[1]/a").click
end

Then("I click on “Customize” button") do
  page.execute_script "window.scrollBy(0,-5000)"
  find(:xpath, "//*[@id='customise-portfolio']/div/div[2]/div/div[1]/div[3]/a").click
end

Then("slide SPDR S&P 500 ETF TRUST SPY US EQUITY to 50%") do
  fill_in(:xpath, "//*[@id='customise-portfolio']/div/div[2]/div/div[3]/div/div[2]/div[2]/div[2]/input", :with =>'50')
end

Then("click on “Rebalance” button") do
  find(:xpath, "//*[@id='customise-portfolio']/div/div[2]/div/div[1]/div[2]/a").click
end

Then("click on “Invest” button") do
  find(:xpath, "//*[@id='customise-portfolio']/div/div[2]/div/div[1]/div[4]/a").click
end

Then("verify “SPDR...” under “What your portfolio contain ?” to be 50%") do
  page.execute_script "window.scrollBy(0,-10000)"
  confirm = find(:xpath, "//*[@id='suggestion-page-body']/div/div/div[4]/div[2]/div/div/ul/li[1]/div/div/div[2]/span")
  confirm.text.include?("SPDR S&P500 ETF Trust")
end