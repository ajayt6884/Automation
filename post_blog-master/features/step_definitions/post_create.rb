Given("i am on trash page") do
  	@home = Home.new
  	@home.load
end

Then("i click on the back button") do
    @home = Home.new
  	@home.load
  	@home.back_button.click
end

Then("i click on the new post button") do
	@home = Home.new
  	@home.load
  	@home.back_button.click
  	@post_new = Post_Html.new
  	@post_new.new_post.click
end

Then("i entered the body and title values") do
	@home = Home.new
  	@home.load
  	@home.back_button.click
  	@post_new = Post_Html.new
  	@post_new.new_post.click
 	@post_new.create_post_with('test-title' , 'test-body')
end

Then("i click on the create post button") do
  	@home = Home.new
  	@home.load
  	@home.back_button.click
  	@post_new = Post_Html.new
  	@post_new.new_post.click
 	@post_new.create_post_with('test-title' , 'test-body')
 	@post_new.submit_button.click
end
