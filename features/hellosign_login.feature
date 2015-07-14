Feature: HelloSign

  Scenario Outline: SignIn with wrong credentials
    Given I go to home page
    When I click on Login button
    When Welcome Back popup window opens
    When I put an "<email>"
    When I enter "<password>"
    When I click on Sign In button
    Then I get an "<error_message>"
    Examples:
      |email              |   password  |    error_message                |
      | notanemail        | notapassword| Invalid email address           |
      | email@example.com | wrongpass   | Invalid username/password combo.|