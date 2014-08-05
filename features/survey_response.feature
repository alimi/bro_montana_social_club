Feature: Survey response

  Background:
    Given there is an active survey named "2014 Survey"
    And the active survey has a question "What's your favorite color?" with the choices "red, blue, green"
    And there is a user with email "test@user.com" and password "password"
    And I login as "test@user.com" with "password"

  Scenario: A user completes a survey
    When I answer "What's your favorite color?" with "blue"
    And I submit the survey
    Then I should see a message that my response was submitted
