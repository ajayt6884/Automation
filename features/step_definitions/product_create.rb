Given(/^i am signin and on orders page$/) do
	@home = Home.new
  @home.load
  @signin = Signin.new
  @signin.signin_with('ajay.thakur+10@vinsol.com','123456')
  @signin.signin.click
  @order = Order.new
  @order.load
end

When(/^i click on product tab$/) do
  @product = Product.new
  @product.product_tab.click
  @product.product_link.click
  @product.new_product.click
end

Then(/^i enter valid data in product fields$/) do
  @product = Product.new
  @product.create_product_with('test1','20')
  @product.shipping.click
  @product.shipping_method.click #select("Default")
  @product.vendor.click #select('KFC')
  #p @product.vendor_select.length
  #p @product.vendor_select.last
  @product.vendor_select.last.click  #select(presentation)
  @product.create.click
end

Then(/^new product created successfully$/) do
	@user = User.new
  @user.product_new
end



