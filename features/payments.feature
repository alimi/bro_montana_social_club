Feature: Payments

  Background:
    Given there is an active survey named "2014 Survey"
    And there is a due for this year of $"20"
    And there is a user with email "test@user.com" and password "password"
    And I login as "test@user.com" with "password"

  Scenario: A user visits the payments page without completing the active survey
    When I visit the payments page
    Then I should see the survey page for the active survey

  Scenario: A user visits the payments page after completing the active survey
    Given "test@user.com" already completed the active survey
    When I visit the payments page
    Then I should see the payment page

  Scenario: A user visits the payments page after completing the active survey and paying annual dues
    Given "test@user.com" already completed the active survey
    And "test@user.com" has paid annual dues
    When I visit the payments page
    Then I should see the homepage
