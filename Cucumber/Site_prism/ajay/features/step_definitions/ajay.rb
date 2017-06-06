Given(/^i m on deal detail page$/) do
  @home = Home.new
  @home.load
  @home.popup.click
end

When(/^i select a option value$/)do
  @buy = Buy_deal.new
  @buy.option_value.click
  #@buy.buy.click
end

When(/^i click on buy button$/) do
  # @buy = Buy_deal.new
  #@buy.buy_from
  Capybara.execute_script "window.scrollBy(0,-1000)"
  @buy.buy.click
  #@buy.dropdown.click

  #@buy.buy.click
end

Then(/^deal is added to my cart$/) do
  @user = User.new
  @user.success_message
end
