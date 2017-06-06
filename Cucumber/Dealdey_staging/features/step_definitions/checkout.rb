Given(/^i am on home page$/) do
  @home = Home.new
  @home.load
  @home.popup.click
  @home.signin_button.click
end

Given(/^i am signin$/) do
  @signin = Signin.new
  @signin.signin_with('ajay.thakur@vinsol.com','jaythakur1')
  @signin.signin.click
end

Given(/^i select a category city & travel from the top$/) do
  @select = Select_category.new
  @select.category.click
end

Given(/^i added the deal to the cart$/) do
  @select1 = Select_deal.new
  @select1.deal.click
  @buy = Buy_deal.new
  @buy.option_value.click
  Capybara.execute_script "window.scrollBy(0,-1000)"
  @buy.buy.click
end

When(/^i click on proceed button$/) do
  @proceed = Proceed.new
  @proceed.proceed1.click
end

Then(/^i should redirect to address page and i again click on proceed button$/) do
  @proceed.proceed2.click
end

Then(/^i click on payment$/) do
  @payment = Payment.new
  @payment.pay.click
end

Then(/^i see a message new order is placed successfully$/) do
  @user = User_order.new
  @user.success_message
end
