require 'fileutils'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'capybara-screenshot/cucumber'
require 'selenium-webdriver'

# Loading base path
if ENV["CUC_BASE"].nil?
  printf "Error: Env variable CUC_BASE is not set.\n"
  exit
end

# Loading testbed file
if ENV["TESTBED"].nil?
  printf "Error: Env variable TESTBED is not set.\n"
  exit
end
config_path = ENV["CUC_BASE"] + '/configs/' + ENV["TESTBED"] + '.rb'
load config_path

driver_override = ENV["CAPYBARA_DRIVER"]
if driver_override && driver_override.length > 0
  if driver_override == "selenium"
    Capybara.default_driver = :selenium
  elsif driver_override == "selenium_geckodriver"
    Capybara.default_driver = :selenium_geckodriver
  else
    puts "ERROR: invalid value for CAPYBARA_DRIVER"
    exit 1
  end
end

# Registration of web drivers
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :selenium_geckodriver do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox, marionette: true)
end

# Setting Capybara configs
# Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium
Capybara.run_server = false
Capybara.app_host = CONFIG['app']['url']
Capybara.default_max_wait_time = 10
Capybara::Screenshot.prune_strategy = :keep_last_run