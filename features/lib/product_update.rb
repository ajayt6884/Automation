class Product_Update < SitePrism::Page
	
	element :exsiting_product, "#spree_product_1 > td:nth-child(4) > a:nth-child(1)"
	element :product_name, "#product_name"
	element :update_button, "button.btn"
	def update_product_with(product_name)
		self.product_name.set "#{product_name}"
	end

end