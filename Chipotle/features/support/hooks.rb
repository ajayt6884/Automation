Before do |scenario|
  Capybara.current_driver = :selenium
  Capybara.default_max_wait_time = 10
  page.driver.browser.manage.window.maximize
end

After do |scenario|
  page.execute_script "window.close();"
  #Rails.logger.debug "Starting scenario: #{ Submit General Inquiry form successfully }"
end


#for headless testing

# Before do |scenario|
# 	 Capybara.current_driver = :poltergeist
# 	 Capybara.register_driver :poltergeist do |app|
# 	  Capybara::Poltergeist::Driver.new(app, {js_errors: false})
# 	end
# 	Capybara::Screenshot.screenshot_and_save_page
#
# end



