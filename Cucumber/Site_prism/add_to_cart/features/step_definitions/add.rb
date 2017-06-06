Given(/^i am on home page$/) do
  @home = Home.new
  @home.load
  @home.popup.click
end

Given(/^I select a category city & travel from the top$/) do
  @select = Select_category.new
  @select.select_cat
  @select.category.click
end

When(/^I select an deal from the city & travel page$/) do
  @select1 = Select_deal.new
  @select1.select_deal
  @select1.deal.click
end

Then(/^I should redirect to deal detail page$/) do
  @buy = Buy_deal.new
end

When(/^I add the deal to my cart$/) do
  @buy.option_value.click
  Capybara.execute_script "window.scrollBy(0,-1000)"
  @buy.buy.click
end

Then(/^I should see the deal in my cart$/) do
  @user = User.new
  @user.success_message
end

Then(/^i click on continue shopping button$/) do
  @countinue = Countinue_shopping.new
  @countinue.countinue_shopping.click
end

Then(/^i should redirect to deal deatil page again$/) do
  @buy
end

Then(/^i click on fashion category$/) do
  @select.fashion_category.click
end

Then(/^i click on deal from fashion category$/) do
  @select1.deal2.click
end

When(/^i add the deal to my cart$/) do
  @buy.option_value2.click
  Capybara.execute_script "window.scrollBy(0,-1000)"
  @buy.buy2.click
end

Then(/^i should see the deal in my cart$/) do
  @user = User.new
  @user.success_message
end
