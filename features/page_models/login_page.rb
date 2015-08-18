class LoginPage < PageActions

  def login_field
    @browser.find_element(:id, "userName")
  end

  def password_field
    @browser.find_element(:id, "password")
  end

  def sign_in_button
    @browser.find_element(:id, "sign-in-button")
  end



end