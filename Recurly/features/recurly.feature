@entire
Feature: Recurly Aptitude Test: UI Automtion
  Valid Recurly profile and number of accounts are created
  Log in to Recurly page
  Navigate to Account Summary page (click on Accounts in the left-hand menu
  Confirm that the page gets displayed properly andconfirm that the correct number of accounts are being displayed

  Scenario Outline: Verify number of accounts on Summary page
    Given User opens <"url"> of Login page
    And User enters valid credentials: <"email"> email address and <"password"> password
    Then User clicks on Login button
    When User selects <"menu_link">
    Then User verifies the correct page is displayed <"menu_link">
    And User verifies that the correct User's <"email"> email address is displayed on the page <"menu_link">
    Then User verifies that the correct <"number_of_accounts"> number of accounts are displayed on the page <"menu_link">
    Examples:
      | "number_of_accounts" | "url"                       | "email"             |"password"| "menu_link" |
      |             1        |https://app.recurly.com/login| alsush555@gmail.com | vasya@098|  Accounts   |
      |             3        |https://app.recurly.com/login| alsush555@gmail.com | vasya@098|  Accounts   |
      |             1        |https://app.recurly.com/login| alsush555@gmail.com | vasya@098|Subscriptions|
