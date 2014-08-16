Feature: Survey response

  Background:
    Given there is an active survey named "2014 Survey"
    And the active survey has a question "What's your favorite color?" with the choices "red, blue, green"
    And there is a due for this year of $"20"
    And there is a user with email "test@user.com" and password "password"

  Scenario: A user completes the active survey and has not paid annual dues
    When I login as "test@user.com" with "password"
    And I answer "What's your favorite color?" with "blue"
    And I submit the survey
    Then I should see a message that my response was submitted
    And I should see the payment page

  Scenario: A user visits the active survey after submitting a response and has not paid dues
    When "test@user.com" already completed the active survey
    And "test@user.com" has not paid annual dues
    And I login as "test@user.com" with "password"
    Then I should see the payment page

  Scenario: A user visits the active survey after submitting a response and has paid dues
    When "test@user.com" already completed the active survey
    And "test@user.com" has paid annual dues
    And I login as "test@user.com" with "password"
    Then I should be redirected to the home page
