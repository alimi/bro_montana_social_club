Feature: User invitations

  Background:
    Given there is an invitation for "invited@user.com"

  Scenario: A user accepts an invitation
    When I follow the invitation link sent to "invited@user.com"
    And I fill out my user information
    Then I should see the homepage

  Scenario: A user tries to accept an invitation but enters invalid information
    When I follow the invitation link sent to "invited@user.com"
    And I enter invalid user information
    Then I should see the invitation page
