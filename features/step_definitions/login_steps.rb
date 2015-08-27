Given(/^I navigate to home page$/) do
  create_browser
  usps.home_page.visit
end

Then(/^I click on Login button$/) do
  usps.home_page.login_button.click
end

And(/^I type "([^"]*)" as a login$/) do |login|
  usps.login_page.login_field.send_keys login
end

And(/^I type "([^"]*)" as a password$/) do |password|
  usps.login_page.password_field.send_keys password
end

Then(/^I click on Signin button$/) do
  usps.login_page.sign_in_button.click
end

And(/^I should be signed\-in as a user "([^"]*)"$/) do |name|
  expected_value = "Hi, #{name}"
  expect(usps.home_page.login_button.text).to be == expected_value
end

Given(/^I should be signed in with "([^"]*)" and "([^"]*)"$/) do |login, password|
  steps %{
    Then I click on Login button
    And I type "#{login}" as a login
    And I type ""#{password}"" as a password
    Then I click on Signin button
  }
end

And(/^I should get "([^"]*)"$/) do |user_error_message|
  if usps.login_page.login_field.attribute('value').empty?
    error = usps.home_page.no_user_error_message
  else
    error = usps.home_page.wrong_password_error_message
  end
  expect(error.text).to be == user_error_message
  expect(error.displayed?).to be == true
  puts "Actual message is: " + user_error_message.to_s
end

Then(/^I press calculate a price link$/) do
 usps.home_page.calculate_price.click
end

Then(/^I verify Zip Code Lookup URL$/) do
  #1 move zip_code_lookup_link method to its own class page PriceCalculator (create it)
  #2 verify HREF is not empty
  usps.home_page.zip_code_lookup_link.attribute :href
end

Then(/^I click on Post Office Locator link$/) do
  usps.home_page.post_office_locator_link.click
  sleep 5
end