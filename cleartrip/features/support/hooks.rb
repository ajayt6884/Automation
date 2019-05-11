Before do |scenario|
  Capybara.current_driver = :selenium
  Capybara.default_max_wait_time = 20
  Capybara.page.driver.browser.manage.window.maximize

end

After do |scenario|
  page.execute_script "window.close();"
end

