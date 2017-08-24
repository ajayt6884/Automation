$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..','lib','pages'))

require 'rubygems'
require 'require_all'
require "rspec"
include RSpec::Expectations
require 'page-object'
require 'page-object/page_factory'
require 'factory_girl'
#require 'rubysl-base64'
require 'httpclient'
require_all 'E:/rnd/cukes/lib/pages'

World(PageObject::PageFactory)

