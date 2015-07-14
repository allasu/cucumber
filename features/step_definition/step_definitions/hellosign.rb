def open_home_page
  $dr.get "https://www.hellosign.com"
end

def  log_in
  path = "//*[@id='dropDownMenu']/div/span[1]/div/a"
  $dr.find_element(:xpath => path).click
end

def pop_up_window
  if $dr.find_element(:xpath => "//*[@id='login_form']/div/..//h3").displayed?
    win_text = $dr.find_element(:xpath => "//*[@id='login_form']/div/..//h3")
    if (!win_text.text.eql? "Welcome back")
      puts "Wrong window opened"
    end
  end
end


def enter_email(email)
  $dr.find_element(:id, 'login_email_address_input').send_keys (email)
end

def enter_password(password)
  $dr.find_element(:id, 'login_password_input').send_keys (password)
end

def click_sign_in
  $dr.find_element(:xpath => "//*[@id='login_form']/div/..//button").click
end

def validate_error_message(error_message)
  wait = Selenium::WebDriver::Wait.new(:timeout => 30)
  err = wait.until {$dr.find_element(:xpath => "//*[@id='login_form']/div/..//p")}
    if err.displayed?
    if err.text.eql? error_message
      puts err.text
      puts "TEST PASSED"
    else
      puts "TEST FAILED"
    end
  end
end

