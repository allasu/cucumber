Given(/^User has (.*?) created$/) do |number_of_accounts|
  $num = number_of_accounts
end

Given(/^User opens (.*?) of Login page$/) do |url|
  $br.goto url
end

When(/^User enters (.*?)$/) do |email|
  $br.text_field(:id, 'user_email').set email
end

And (/^User puts (.*?)$/) do |password|
  $br.text_field(:id, 'user_password').set password
end

Then(/^User clicks on Login button$/) do
  $br.button(:xpath, "//input[@name = 'commit']").click
end

When(/^User selects (.*?)$/) do |menu_link|
  link_text = []
  path = "//*[@id='customer_service_group']//a"
  link_text = $br.links(:xpath, path)
  link_text.each do |l_text|
    if l_text.text == menu_link
      l_text.click
    end
  end
end


Then(/^User verifies the correct page is displayed (.*?)$/) do |menu_link|
  path = "//*[@class='page_title']"
  if $br.element(:xpath, path).exist?
    page_title = $br.element(:xpath, path).text
    #puts page_title
  end

  if menu_link == page_title
    puts "The page is displayed properly"
  else
    puts "The wrong page gets open"
  end

  if menu_link != "Accounts"
    $br.quit
  end
end


And(/^User verifies that the correct User's (.*?) address is displayed$/) do |email|
  path = "//*[@id='pane']//tr/td[3]"
  email_field = $br.element(:xpath, path).text
  #puts email_field
  if email_field == email
    puts "The correct User's page is displayed"
  else
    puts "The page belongs to a different user"
  end
end


Then(/^User verifies that the correct (.*?) are displayed$/) do |number_of_accounts|
  path = "//*[@class='all_accounts selected']//span[3]"
  acc_num = br.element(:xpath, path).text
  #puts acc_num
  if acc_num == number_of_accounts
    puts "The correct number of accounts is displayed"
  else
    puts "The number of accounts is incorrect"
  end
end