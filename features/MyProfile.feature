@Regression
Feature: MyProfile

  Background:
    Given Users prints comment "User navigates to the Vike page"
    When Users navigates to the Login page
    Then Page title is equal to "VIKE"

  Scenario: Open & Close my prolife
    # Login
    When Users enter to "Login" value "bogi7up+1@gmail.com"
    When Users enter to "Password" value "287446"
    When Users click on "loginBtn"
    When Users wait 2 sec.
    When Users click on "myProfile"
    Then Check profile form is visible
    When Users click on "closeProfileForm"

  Scenario: Check the text on my profile form
    # Login
    When Users enter to "Login" value "bogi7up+1@gmail.com"
    When Users enter to "Password" value "287446"
    When Users click on "loginBtn"
    When Users wait 2 sec.
    # Click on profile element
    When Users click on "myProfile"
    Then Check profile form is visible

    Then Check the text "Change password"
    Then Check the text "Update my profile"


  Scenario: Login => Change password to New
    # Login
    When Users enter to "Login" value "bogi7up+1@gmail.com"
    When Users enter to "Password" value "287446"
    When Users click on "loginBtn"
    When Users wait 2 sec.
    # Close form "New Project"
#    When Users click on "closeProjectForm"

    # Click on profile element
    When Users click on "myProfile"
    Then Check profile form is visible
    # Enter old & new password
    When Users enter to "oldPassword" value "287446"
    When Users enter to "newPassword" value "123456"
    When Users click on "saveBtn"
    When Users wait 2 sec.

    When Users click on "statusBar"
    When Users click on "logOutBtn"
    When Users wait 2 sec.

  Scenario: Login => With New password
    # Enter already changed password
    When Users enter to "Login" value "bogi7up+1@gmail.com"
    When Users enter to "Password" value "287446"
    When Users click on "loginBtn"
    When Users wait 2 sec.
    # Log out after login
    When Users click on "statusBar"
    When Users click on "logOutBtn"