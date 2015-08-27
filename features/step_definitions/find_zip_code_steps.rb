Given(/^I navigate to USPS look up Zip Code page$/) do
  create_browser
  #binding.pry
  usps.find_zip_code_page.visit
end

And(/^I type "([^"]*)" to street address field$/) do |address|
  usps.find_zip_code_page.address_text_field.send_keys address
end

Then(/^I type "([^"]*)" to city field$/) do |city|
  usps.find_zip_code_page.city_text_field.send_keys city
end

Then(/^I select "([^"]*)" from states dropdown list$/) do |state|
  expect(state.dropdown).to include state
  usps.find_zip_code_page.select_state(state)
end

And(/^I press Find Zip Code button$/) do
  usps.find_zip_code_page.find_zip_code_button.click
end

Then(/^I see results on look up a zip code page$/) do
  expect(usps.find_zip_code_page.see_results.size).to be > 0
  expect(usps.find_zip_code_page.collect_zip_codes).not_to include nil
end