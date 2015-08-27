class HomePage < PageActions

  def path
    "http://www.usps.com"
  end

  def login_button
    @browser.find_element(:id, "anchor-login")
  end

  def no_user_error_message
    @browser.find_element(:id, "error-invalid-username")
  end

  def wrong_password_error_message
    @browser.find_element(:css, 'span.error')
    #@browser.find_element(:xpath, "//*[@id='actionerrors']/div/span")
  end

  def calculate_price
    @browser.find_element(:xpath, ("//a[@class='quick-tools--link quick-tools--calcprice' and text()=\"Calculate a Price\"]"))
    #@browser.find_element(:xpath, ("//a[@class='menu--tier-one-link menu--item' and text()=\"Mail & Ship\"]"))
  end

  def zip_code_lookup_link
    @browser.find_element(:id, "ctl00_ContentPlaceHolder1_HyperLink2")
  end

  def post_office_locator_link
    @browser.find_element(:xpath, "//a[@href='https://www.usps.com/locator/welcome.htm']")
  end

  end


