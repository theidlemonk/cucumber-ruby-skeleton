require 'pry'
require 'rspec/expectations'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium/webdriver'

#require 'spec_helper'
# $port = 1024
#Capybara.app_host = '<localhost>:<port>'
Capybara.configure do |config|
  config.run_server = true
  #Capybara.default_host = "<localhost>:<port>"
  config.default_driver = :selenium #Selenium::WebDriver.for :ie
  #config.app = "make sure this isn't nil"
  # config.app_host = "<localhost>:<port>"
  # config.server_port = $port
end

Capybara.register_driver :selenium do |app|
  # optional
  client = Selenium::WebDriver::Remote::Http::Default.new
  # optional
  #client.timeout = 120
  Capybara::Selenium::Driver.new(app, :http_client => client)
end
#set default js driver
Capybara.javascript_driver = :firefox
