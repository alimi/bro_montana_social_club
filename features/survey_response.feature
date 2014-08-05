Feature: Survey response

  Background:
    Given there is an active survey named "2014 Survey"
    And the active survey has a question "What's your favorite color?" with the choices "red, blue, green"
    And there is a user with email "test@user.com" and password "password"

  Scenario: A user completes the active survey
    When I login as "test@user.com" with "password"
    And I answer "What's your favorite color?" with "blue"
    And I submit the survey
    Then I should see a message that my response was submitted

  Scenario: A user attempts to visit the active survey after submitting a response
    When "test@user.com" already completed the active survey
    When I login as "test@user.com" with "password"
    Then I should be redirected to the home page
