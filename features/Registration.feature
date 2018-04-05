@Regression
Feature: REG1

  Given User test

@Regression
Feature: registration

  Background:

    When User navigates to the SignUp page
    Then Page title is equal to "VIKE"

  Scenario: 1: Registration with already present e-mail
    When User enter his e-mail: "illya.kalynchuk@thinkmobiles.com" to the field
    When User click the SignUp button
    Then Error with text "user with this email already exists." is displayed

    Scenario: 2: Registration for new user
      When User enters New e-mail to the field
      When User click the SignIn button
      Then User navigates to the SignIn page
      When User enter his New e-mail to the field
      When User enter his password to the field
      When User click the SignIn button
      Then User navigates to the Main page
