require_relative "page_actions"
class HomePage < PageActions

  def path
    "http://www.usps.com"
  end

  def login_button
    @browser.find_element(:id, "anchor-login")
  end

end