Feature: User invitations

  Background:
    Given there is an invitation for "invited@user.com"
    And there is an active survey named "2014 Survey"
    And the active survey has a question "What's your favorite color?" with the choices "red, blue, green"

  Scenario: A user accepts an invitation
    When I follow the invitation link sent to "invited@user.com"
    And I fill out my user information
    Then I should see the currently active survey

  Scenario: A user tries to accept an invitation but enters invalid information
    When I follow the invitation link sent to "invited@user.com"
    And I enter invalid user information
    Then I should see the invitation page

  Scenario: A user visits the invitation path for an expired invitation
    Given the invitation for "invited@user.com" is expired
    When I follow the invitation link sent to "invited@user.com"
    Then I should see an expired invitation message

  Scenario: A user visits the invitation path for an invitation she already accepted
    Given the invitation for "invited@user.com" has been accepted
    When I follow the invitation link sent to "invited@user.com"
    Then I should see the homepage
