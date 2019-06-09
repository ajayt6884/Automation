require 'capybara/dsl'
require 'selenium-webdriver'
require 'site_prism'
require 'active_record'
require 'rails'
require 'active_record/fixtures'
require 'cucumber/rails'


Before do
  ActiveRecord::FixtureSet.reset_cache
  fixtures_folder = File.join(Rails.root, 'features', 'fixtures')
  fixtures = Dir[File.join(fixtures_folder, '*.yml')].map {|f| File.basename(f, '.yml') }
  ActiveRecord::FixtureSet.create_fixtures(fixtures_folder, fixtures)
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
	end
	Capybara.default_max_wait_time = 10
end

