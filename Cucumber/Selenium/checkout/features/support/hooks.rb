Before do |scenario|
  @driver = Selenium::WebDriver.for :firefox
  @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
  @driver.manage.window.maximize
end

After do |scenario|
  @driver.quit
end
