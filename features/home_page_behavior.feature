Feature: Home page behavior

  Background:
    Given there is an active survey named "2014 Survey"
    And there is a due for this year of $"20"
    And there is a user with email "test@user.com" and password "password"
    And I login as "test@user.com" with "password"

  Scenario: A user visits the homepage and has not completed the active survey
    When I visit the homepage
    Then I should see the survey page for the active survey

  Scenario: A user vists the homepage and has completed the active survey but has not paid annual dues
    Given "test@user.com" has completed the active survey
    And "test@user.com" has not paid annual dues
    When I visit the homepage
    Then I should see the payment page

  Scenario: A user vists the homepage and has completed the active survey and has paid annual dues
    Given "test@user.com" has completed the active survey
    And "test@user.com" has paid annual dues
    When I visit the homepage
    Then I should see the homepage
