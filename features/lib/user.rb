class User < SitePrism::Page
	
	element :message, ".alert-success"
	element :error_message, ".alert"
	element :product_new, ".alert-success"
	element :existing_product_success, "h1.col-sm-6"
	element :update_product, ".alert-success"
	element :delete_product, ".alert-success"
	element :api_status, ".linenums > li:nth-child(1) > span:nth-child(1) > span:nth-child(3)"

end