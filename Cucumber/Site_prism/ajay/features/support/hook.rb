Before do |scenario|
  Capybara.current_driver = :selenium
  Capybara.default_max_wait_time = 5
  Capybara.page.driver.browser.manage.window.maximize
  #Capybara.default_selector = :title
  #Capybara.page.driver.browser.window_handles.length.should == 1
end

After do |scenario|
  page.execute_script "window.close();"
end

