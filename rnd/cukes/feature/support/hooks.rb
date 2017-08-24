require "selenium-webdriver"
include Datamagic

def browser_name
  (ENV['BROWSER'] ||= 'firefox').downcase.to_sym
end

#def environment
#  (ENV['ENVI'] ||= 'int').downcase.to_sym
#end 

Before do | scenario |
	DataMagic.load 'default.yml'
=begin for firefox==
 profile = Selenium::WebDriver::Firefox::Profile.new
 profile['signon.autologin.proxy'] = true
 @browser = Selenium::WebDriver.for( :firefox, :profile => profile)
=end
=begin FOR chrome== chromedriver is copied to "C:\RailsInstaller\Ruby1.9.3\bin"
profile = Selenium::WebDriver::Chrome::Profile.new
profile['download.prompt_for_download'] = false
profile['download.default_directory'] = "C:/Users/vijay/selenium-server-standalone-2.35.0/chromedriver.exe"

@browser = Selenium::WebDriver.for :chrome, :profile => profile
=end 
#fprofile = Selenium::WebDriver::Firefox::Profile.new
#fprofile['signon.autologin.proxy'] = true
#DesiredCapabilities fcapability = DesiredCapabilities.firefox(:firefox_profile => 'fprofile');
#===for remote
#if environment == :int
if browser_name == :firefox
	capabilities1 = Selenium::WebDriver::Remote::Capabilities.new
	capabilities1.browser_name = browser_name
	capabilities1.platform = :WINDOWS
	@browser = Selenium::WebDriver.for( :remote,
    	:desired_capabilities => capabilities1
	)
elsif browser_name == :chrome
	capabilities2 = Selenium::WebDriver::Remote::Capabilities.new
	capabilities2.browser_name = browser_name
	capabilities2.platform = :WINDOWS
	@browser = Selenium::WebDriver.for(:remote,
	 	:desired_capabilities => capabilities2
	)
end

=begin
capabilities3 = Selenium::WebDriver::Remote::Capabilities.new
capabilities3.browser_name = :internet_explorer
capabilities3.platform = :WINDOWS

@browser = Selenium::WebDriver.for(:remote, 
									:desired_capabilities => capabilities3
)

=end
#capabilities = Selenium::WebDriver::Remote::Capabilities.firefox
#capabilities.setPlatform("WINDOWS");  
#@browser = Selenium::WebDriver.for(:desired_capabilities => :capabilities)


#==============
 @browser.manage.window.maximize
 @accept_next_alert = true
 @browser.manage.timeouts.implicit_wait = 20
 #@wait = Selenium::WebDriver::Wait.new(:timeout => 30)
 @verification_errors = []
 @browser.get(data_for(:home)["url"])
end
=begin 	

 @verification_errors = []
 @verification_count=0

def verify(&blk)
    @@verification_count=@@verification_count+1
    yield
      rescue Exception => ex
    @@verification_errors << ex
end
=end

After do
 @browser.quit
 @verification_errors.should == []
end

