Given(/^i am on product page$/) do
  @home = Home.new
  @home.load
  @signin = Signin.new
  @signin.signin_with('ajay.thakur+10@vinsol.com','123456')
  @signin.signin.click
  @product = Product_Page.new
  @product.load
end

When(/^i click on delete button$/) do
	@product = Product_Delete.new
	@product.delete_button.click 
  page.driver.browser.switch_to.alert.accept 
end

Then(/^the product delete successfully$/) do
  @user = User.new
  @user.delete_product
end

