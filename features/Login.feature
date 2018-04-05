
  Background:
    Given Users prints comment "User navigates to the Vike page"
    When Users navigates to the Login page
    Then Page title is equal to "VIKE"


  Scenario: Login => With New password
    # Enter already changed password
When Users enter to "Login" value "bogi7up+1@gmail.com"
When Users enter to "Password" value "287446"
When Users click on "loginBtn"
When Users wait 2 sec.
    # Log out after login
When Users click on "statusBar"
When Users click on "logOutBtn"