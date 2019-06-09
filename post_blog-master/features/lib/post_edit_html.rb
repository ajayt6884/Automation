class Post_Edit_Html < SitePrism::Page
	element :edit_button, "body > table > tbody > tr:nth-child(1) > td:nth-child(4) > a"
	element :update_title, "#post_title"
	element :update_body, "#post_body"
	element :update_button, 'input[name="commit"]'

	def update_post_with(update_title,update_body)
		self.update_title.set "#{update_title}"
		self.update_body.set "#{update_body}"
	end

end
