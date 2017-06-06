class Api_signin < SitePrism::Page
	
	element :url, "#request-url"
	element :method, "#request-method-list > li:nth-child(2) > a:nth-child(1)"
	element :body, "#request-body"
	element :send_button, "#request-button"

	def signin_with(url,body)
		self.url.set "#{url}"
		self.body.set "#{body}"
	end

end