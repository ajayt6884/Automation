class Product < SitePrism::Page
	
	element :product_tab, "ul.nav-sidebar:nth-child(2) > li:nth-child(1) > a:nth-child(1)"
	element :product_link, "#sidebar-product > li:nth-child(1) > a:nth-child(1)"
	element :new_product, "#admin_new_product"
	element :product_name, "#product_name"
	element :product_price, "#product_price"
	element :shipping, "#s2id_product_shipping_category_id > a:nth-child(1)"
	element :shipping_method, "#product_shipping_category_id > option:nth-child(2)"#select[id='product_shipping_category_id']"
	element :vendor, "#s2id_product_vendor_id > a:nth-child(1)"
	#elements :vendor_select, ".select2-match"
	elements :vendor_select, ".select2-result-label"
	#element :vendor_select, "#select2-result-label-31 > span:nth-child(1)"#select2-result-label-29
	element :create, "button.btn"

	def create_product_with(product_name,product_price)
		self.product_name.set "#{product_name}"
		self.product_price.set "#{product_price}"
	end

end