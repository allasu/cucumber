class FindZipCodePage  < PageActions

  def path
    "https://tools.usps.com/go/ZipLookupAction_input"
  end

  def address_text_field
    @browser.find_element(:id, 'tAddress')
  end

  def city_text_field
    @browser.find_element(:id, 'tCity')
  end

  def states_dropdown
    @browser.find_element(:css, 'span.select-current-text')
  end

  def select_state (state)
    states_dropdown.click
    #@br.find_element(:css, 'ul.select-ul').find_elements(:tag_name, 'a')
    state_list = @browser.find_element(:css, 'ul.select-ul').find_elements(:tag_name, 'a')

    state_list.each {|state_name|
      if state_name.text == state
        state_name.click
        break
      end
    }
  end

  def find_zip_code_button
    @browser. find_element(:id, 'lookupZipFindBtn')
  end

  def see_results
    @browser.find_element(:id, 'result-list').find_elements(:tag_name, 'li')

  end

  def collect_zip_codes
    zip_array = []
    see_results.each {|elm|
      #expect(elm.find_element(:css, 'span.zip').text).to be be_truthy
      zip_array << elm.find_element(:css, 'span.zip').text
    }
  end

end