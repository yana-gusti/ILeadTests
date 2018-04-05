@UI_TEXT
Feature: code

  Background: Run and log in
    When Users navigates to the Login page

    When Users enter to "Login" value "bogi7up+1@gmail.com"
    When Users enter to "Password" value "123456"
    When Users click on "loginBtn"
    When Users wait 2 sec.
    When Users click on "myProfile"

  Scenario: Check the text "Change password"
    Then Check profile form is visible
    Then Verify the text "Update my profile" in the "h1" tag

  Scenario: Check the text "Update my profile"
    Then Check profile form is visible
    Then Verify the text "Change password" in the "h2" tag

  Scenario: Check the text "Old password"
    Then Check profile form is visible
    Then Verify the text "Old password" in the "span1" tag

  Scenario: Check the text "New password"
    Then Check profile form is visible
    Then Verify the text "New password" in the "span2" tag

  Scenario: Check the text "Old Password is not correct!"
    Then Check profile form is visible
    When Users enter to "oldPassword" value "83j9f34jf092"
    When Users enter to "newPassword" value "123"
    When Users click on "saveBtn"
    When Users wait 2 sec.
    Then Verify the text "Old Password is not correct!" in the "error1" tag

  Scenario: Check the text "Error_1 < 2 latters"
    Then Check profile form is visible
    When Users enter to "oldPassword" value "1"
    When Users enter to "newPassword" value "123"
    When Users click on "saveBtn"
    Then Verify the text "Please, enter at least 2 letters" in the "error1" tag

  Scenario: Check the text "Please, enter at least 2 letters"
    Then Check profile form is visible
    When Users enter to "oldPassword" value "123"
    When Users enter to "newPassword" value "1"
    When Users click on "saveBtn"
    Then Verify the text "Please, enter at least 2 letters" in the "error2" tag

  Scenario: Check the text "Please, enter at least 2 letters"
    Then Check profile form is visible
    When Users enter to "oldPassword" value "1"
    When Users enter to "newPassword" value "1"
    When Users click on "saveBtn"
    Then Verify the text "Please, enter at least 2 letters" in the "error1" tag
    Then Verify the text "Please, enter at least 2 letters" in the "error2" tag

  Scenario: Check the text "Please, enter at least 2 letters"
    Then Check profile form is visible
    When Users click on "saveBtn"
    Then Verify the text "Please, enter at least 2 letters" in the "error1" tag
    Then Verify the text "Please, enter at least 2 letters" in the "error2" tag