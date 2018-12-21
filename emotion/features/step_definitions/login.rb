Given("I am on home page") do
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/text_view_welcome_header").displayed?
end

When("I click on the Login Button") do
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/button_login").click
end

When("type the email and paasword in the field") do
  a = @driver.find_element(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.RelativeLayout/android.widget.EditText[1]")
  a.click
  a.send_keys("estest@emotion.com")
  b = @driver.find_element(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.RelativeLayout/android.widget.EditText[2]")
  b.click
  b.send_keys("abcd1234")
end

Then("I should be able to Login") do
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/button_login_next").click
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/btn_tutorial_done").click
	@driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/btn_tutorial_done").click
end


When("I click on the any Emotion") do
	@driver.find_element(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.support.v4.widget.DrawerLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.support.v7.widget.RecyclerView/android.widget.RelativeLayout[2]/android.widget.ImageView").click
end


When("move the scroll bar up or down") do
  c = @driver.find_element(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.SeekBar")
  c.click
end

Then("tap on the next button") do
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/button_select_intensity").click
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/btn_skip_tutorial").click
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/rl_add_emotion_cause").click
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/btn_tutorial_done").click
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/text_view_reason_parent_item_name").click
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/btn_see_more_option").click
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/checkbox_reason_child_item").click
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/action_cause_done").click
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/action_cause_done").click
end

Then("click on the finished") do
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/btn_done_widget").click
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/btn_skip_tutorial").click
end

Then("my emotion should be recorded") do
  @driver.find_element(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.support.v4.widget.DrawerLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.widget.TextView").displayed?
end

When("I click on the Hamberger menu") do
  @driver.find_element(:xpath, "//android.widget.ImageButton[@content-desc='Open Drawer']").click
end

When("click on the My Profile button") do
  @driver.find_element(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.support.v4.widget.DrawerLayout/android.widget.ListView/android.widget.RelativeLayout[5]/android.widget.TextView").click
end

Then("click on My Account button") do
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/rl_my_account").click
end

Then("I click on the logout button") do
  @driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/btn_view_sign_out").click
  @driver.find_element(:id, "android:id/button1").click
end

Then("I can logout from the app successfully") do
	@driver.find_element(:id, "com.pfizer.au.EmotionSpace:id/text_view_welcome_header").displayed?
end










