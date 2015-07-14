require 'selenium-webdriver'

$dr = Selenium::WebDriver.for :chrome
$dr.manage().window.maximize()
