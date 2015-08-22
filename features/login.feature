Feature: Login functionality

  @login
  Scenario Outline: Login with valid credentials
    Given I navigate to home page
    Then I click on Login button
    And I type "<login>" as a login
    And I type "<password>" as a password
    Then I click on Signin button
    And I should be signed-in as a user "<name>"
    Examples:
      | login                   | password    | name  |
      #| bayqatraining@gmail.com | Root123456@ | Aleks |
      |   koshka_masha          | Cucumber@123| Alla  |

  Scenario: Login with valid credentials (using nested steps)
    Given I navigate to home page
    Given I should be signed in with "bayqatraining@gmail.com" and "Root123456@"

  @no_user
  Scenario Outline: Login with no user name
    Given I navigate to home page
    Then I click on Login button
    #And I type "<login>" as a login
    And I type "<password>" as a password
    Then I click on Signin button
    And I should get "<user_error_message>"
    Examples:
      | login        | password     |        user_error_message            |
      | koshka_masha | Cucumber@123 | A Username is a required entry. |

  @wrong_password
  Scenario Outline: Login with wrong password
    Given I navigate to home page
    Then I click on Login button
    And I type "<login>" as a login
    And I type "<password>" as a password
    Then I click on Signin button
    And I should get "<password_error_message>"
    Examples:
      | login        | password     |                     password_error_message                          |
      | koshka_masha | abrakadabra   |We do not recognize your username and/or password.  Please try again.|
