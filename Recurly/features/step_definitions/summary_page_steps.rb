Given(/^User opens (.*?) of Login page$/) do |url|
  $br.goto url
end

And (/^User enters valid credentials: (.*?) email address and (.*?) password$/) do |email, password|
  $br.text_field(:id, 'user_email').set email
  $br.text_field(:id, 'user_password').set password
end

Then(/^User clicks on Login button$/) do
  $br.button(:xpath, "//input[@name = 'commit']").click
end


When(/^User selects (.*?)$/) do |menu_link|
  $br.link(:href, '/'+menu_link.downcase).click
end

Then(/^User verifies the correct page is displayed (.*?)$/) do |menu_link|
  path = "//*[@class='page_title']"
  if $br.element(:xpath, path).exist?
    page_title = $br.element(:xpath, path).text
    #puts page_title
  end

  if menu_link == page_title
    puts "The page #{menu_link} is displayed properly"
  else
    puts "The wrong page gets open"
  end

  if menu_link != "Accounts"
    puts "This is not a Summary of Accounts page"
  end
end


And(/^User verifies that the correct User's (.*?) email address is displayed on the page (.*?)$/) do |email, menu_link|
  if menu_link != "Accounts"
    puts "Skip"
  else
    path = "//*[@id='pane']//tr/td[3]"
    email_field = $br.element(:xpath, path).text
    #puts email_field
    if email_field == email
      puts "The page for the right User is opened"
    else
      puts "The page belongs to a different user"
    end
  end

end


Then(/^User verifies that the correct (.*?) number of accounts are displayed on the page (.*?)$/) do |number_of_accounts, menu_link|
  if menu_link != "Accounts"
    puts "Testing is complete."
  else
  path = "//*[@class='all_accounts selected']//span[3]"
  acc_num = $br.element(:xpath, path).text
  puts "Your number of accounts is #{number_of_accounts}, number of accounts displayed is #{acc_num}"
    if number_of_accounts.to_i == acc_num.to_i
      puts "The correct number of accounts is displayed"
    else
      puts "The number of accounts is incorrect"
    end
  end
end