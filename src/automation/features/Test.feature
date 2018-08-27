Feature: Test framework work

  Scenario: Verify framework work
    Given User navigates to "https://www.wikipedia.org/"
    When User enters "Isaac Newton" in Search field "homePage|searchField"
    And User clicks Search button "homePage|searchButton"
    Then Page title "#firstHeading" text is equal to "Isaac Newton"
    And Page URL contains "Isaac_Newton_Page"
