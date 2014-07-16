Feature: Site Access

  Scenario: An unautenticated user attempts to see a page that requires authentication
    When I visit a page that requires authentication
    Then I should see an unauthorized message
