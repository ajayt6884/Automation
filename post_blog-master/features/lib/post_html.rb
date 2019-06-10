class Post_Html < SitePrism::Page
	element :new_post, 'body > a'
	element :title_box, "//*[@id='post_title']"
	element :body_text, "//*[@id='post_body']"
	element :submit_button, 'input[name="commit"]'


	def create_post_with(title_box,body_text)
		self.title_box.set "#{title_box}"
		self.body_text.set "#{body_text}"
	end

end

