@entire
Feature: Recurly Aptitude Test: UI Automtion
  Log in to Recurly page
  Navigate to Account Summary page (click on Accounts in the left-hand menu
  Confirm that the page gets displayed properly andconfirm that the correct number of accounts are being displayed

  Scenario Outline: Verify number of accounts on Summary page
    Given User has <"number_of_accounts"> created
    Given User opens <"url"> of Login page
    When User enters <"email">
    And User puts <"password">
    Then User clicks on Login button
    When User selects <"menu_link">
    Then User verifies the correct page is displayed <"menu_link">
    And User verifies that the correct User's <"email"> address is displayed
    Then User verifies that the correct <"number_of_accounts"> are displayed
    Examples:
      | "number_of_accounts" | "url"                       | "email"             |"password"| "menu_link" |
      |             1        |https://app.recurly.com/login| alsush555@gmail.com | vasya@098|  Accounts   |
      #|             3        |https://app.recurly.com/login| alsush555@gmail.com | vasya@098|  Accounts   |
      #|             1        |https://app.recurly.com/login| alsush555@gmail.com | vasya@098|Subscriptions|
