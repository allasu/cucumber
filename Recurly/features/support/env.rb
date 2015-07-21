require 'watir-webdriver'

$br = Watir::Browser.new :chrome
#$br.driver.manage.timeouts.implicit_wait = 3
$br.window.maximize