require 'appium_lib'

def caps
	{
		caps: 
		{
			platformName: "Android",
  			deviceName: "Simulator",
  			platformVersion: "8.0.0",
  			androidsdkpath: "/Users/vins/Downloads/tools",
			app: 'EmotionSpace.apk',
			apppackage: "com.pfizer.au.EmotionSpace",
			newCommandTimeout: "3600"
		}
	}
end




Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object


Before do 
	@drive.start_driver
end
  	
After do
  	@driver.driver_quit
end