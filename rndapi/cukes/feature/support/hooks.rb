#require "selenium-webdriver"

=begin
Before do | feature |
 
 profile = Selenium::WebDriver::Firefox::Profile.new
 profile['signon.autologin.proxy'] = true
 @browser = Selenium::WebDriver.for(:firefox, :profile => profile)
 @browser.manage.window.maximize
 @base_url = "http://rocksanddolls:@l3rt@lw@ys@rnd.domain4now.com/"
 

 @accept_next_alert = true
 @browser.manage.timeouts.implicit_wait = 20
 #@wait = Selenium::WebDriver::Wait.new(:timeout => 30)
 @verification_errors = []
  @browser.get("http://rocksanddolls:@l3rt@lw@ys@rnd.domain4now.com/")
end

After do
 @browser.quit
 @verification_errors.should == []
end
=end
