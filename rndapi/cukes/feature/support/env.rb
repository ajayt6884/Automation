$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..','lib','pages'))

require 'rubygems'
require 'require_all'
require "rspec"
include RSpec::Expectations
require 'page-object'
require 'page-object/page_factory'
#require 'rest-client'
require 'rubysl-base64'
require 'httparty'
require 'open-uri'
require_all 'E:/rndapi/cukes/lib/pages'

World(PageObject::PageFactory)

#token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9