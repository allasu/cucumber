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
      | bayqatraining@gmail.com | Root123456@ | Aleks |


  Scenario: Login with valid credentials (using nested steps)
    Given I navigate to home page
    Given I should be signed in with "bayqatraining@gmail.com" and "Root123456@"

