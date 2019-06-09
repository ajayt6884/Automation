class Home < SitePrism::Page
	set_url '/trash'
	# set_url_matcher(/localhost:3000\/?/)
	element :back_button, 'a'

end