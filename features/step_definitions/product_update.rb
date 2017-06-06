Given(/^i am on product listing page$/) do
  @home = Home.new
  @home.load
  @signin = Signin.new
  @signin.signin_with('ajay.thakur+10@vinsol.com','123456')
  @signin.signin.click
  @product = Product_Page.new
  @product.load
end

When(/^i click on product$/) do
	@product = Product_Update.new
	@product.exsiting_product.click  
end

Then(/^i should redirect to product detail page$/) do
  @user = User.new
  @user.existing_product_success
end

When(/^i update the name of the product$/) do
	@product = Product_Update.new
	@product.update_product_with('qwerty-update')
	Capybara.execute_script "window.scrollBy(0,10000)"
	@product.update_button.click
end

Then(/^i will see the message product updated successfully$/) do
  @user = User.new
  @user.update_product
  #sleep(3)
end
