Given("i am on the trash page") do
  	@home = Home.new
  	@home.load
end

Then("i click on back button") do
	@home = Home.new
  	@home.load
  	@home.back_button.click
end

Then("i click on the edit post button") do
  	@home = Home.new
  	@home.load
  	@home.back_button.click
  	@post_edit = Post_Edit_Html.new
  	@post_edit.edit_button.click
end

Then("i update the body and title values") do
  	@home = Home.new
  	@home.load
  	@home.back_button.click
  	@post_edit = Post_Edit_Html.new
  	@post_edit.edit_button.click
  	@post_edit.update_post_with('test-title-1' , 'test-body-1')

end

Then("i click on the update post button") do
  @home = Home.new
  	@home.load
  	@home.back_button.click
  	@post_edit = Post_Edit_Html.new
  	@post_edit.edit_button.click
  	@post_edit.update_post_with('test-title-1' , 'test-body-1')
  	@post_edit.update_button.click
end
