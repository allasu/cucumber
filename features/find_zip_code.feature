Feature: Test look up a zip code page

  @zipcode
  Scenario Outline: Happy path for look up a zip code
    Given I navigate to USPS look up Zip Code page
    And I type "<address>" to street address field
    Then I type "<city>" to city field
    Then I select "<state>" from states dropdown list
    And I press Find Zip Code button
    Then I see results on look up a zip code page
    Examples:
      | url             | address                           | city       | state                     |
      | http://usps.com | 1600 Pensylvania Avenue Northwest | Washington | DC - District of Columbia |
