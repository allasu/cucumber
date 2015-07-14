Given(/^I go to home page$/) do
  open_home_page
end

When(/^I click on Login button$/) do
  log_in
end

When(/^Welcome Back popup window opens$/) do
  pop_up_window
end

When(/^I put an "(.*?)"$/) do |email|
  enter_email(email)
end

When(/^I enter "(.*?)"$/) do |password|
  enter_password(password)
end

When(/^I click on Sign In button$/) do
  click_sign_in
end

Then(/^I get an "(.*?)"$/) do |error_message|
  validate_error_message(error_message)
end