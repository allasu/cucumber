require 'selenium-webdriver'
require 'rspec'

SERVER_LABELS ={
    :production => "usps.com",
    :trunk => "trunk.usps.com",
    :integration => "integration.usps.com"
}

def get_browser
  (ENV['BROWSER'] ||= :firefox).to_sym
end

def get_environment
  env = (ENV['SERVER'] ||= :production).to_sym  #we give default value just in case ...
  SERVER_LABELS[env]
end

def create_browser
  @browser = Selenium::WebDriver.for get_browser
  @browser.manage.window.maximize
end

def usps
  @usps ||= USPS.new @browser
end

