require_relative "page_actions"
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
  end

end


