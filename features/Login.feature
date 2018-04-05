@Regression
Feature: Login

  Background:
    Given Users prints comment "User navigates to the Vike page"
    When Users navigates to the Login page
    Then Page title is equal to "VIKE"

  Scenario: Login with incorrect password
    # Login with bad password
    When Users enter to "Login" value "bogi7up+1@gmail.com"
    When Users enter to "Password" value "kju943puriojk23q90"
    When Users click on "loginBtn"