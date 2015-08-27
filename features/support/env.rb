require 'selenium-webdriver'
require 'rspec'
require 'pry'
require_relative '../page_models/page_actions'
Dir["../page_models/*.rb"].each {|file| require file}


server_labels ={
    :production => "usps.com",
    :trunk => "trunk.usps.com",
    :integration => "integration.usps.com"
}

def get_browser
  (ENV['BROWSER'] ||= :firefox).to_sym
end

def get_environment
  env = (ENV['SERVER'] ||= :production).to_sym  #we give default value just in case ...
  server_labels[env]
end

def create_browser
  @browser = Selenium::WebDriver.for get_browser
  @browser.manage.window.maximize


end

def usps
  @usps ||= USPS.new @browser
end

