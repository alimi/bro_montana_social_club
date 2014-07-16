Feature: User login

  Background:
    Given there is a user with email "test@user.com" and password "password"
    And there is an active survery named "2014 Survery"

  Scenario: A user logs in with valid credentials
    When I visit the login page
    And I login as "test@user.com" with "password"
    Then I should see the currently active survery

  Scenario: A user logs in with invalid credentials
    When I visit the login page
    And I login as "test@user.com" with "invalid_password"
    Then I should see an invalid login error message
