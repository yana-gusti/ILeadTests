Feature: Check login and registration functional

#  Scenario: 1: Check login positive case
#    When User navigates to "ILead_SignIn_Page"
#    And User enters "kokriashkina@exedel.com" in textboxemail "loginPage|emailfield"
#    And User enters "12345678" in textboxpassword "loginPage|passwordfield"
#    And User clicks butttonLogin "loginPage|singInButton"
#    Then Page URL is equal to "ILead_Home_Page"
#    When User clicks menu "homePage|secondarymenulink" with text "Sign out"
#    Then User navigates to "ILead_Main_Page"

#   Scenario: 2: Check login negative case
#    When User navigates to "ILead_SignIn_Page"
#    And User enters "test@exedel.com" in textboxemail "loginPage|emailfield"
#    And User enters "12345678" in textboxpassword "loginPage|passwordfield"
#    And User clicks butttonLogin "loginPage|singInButton"
#    Then Tost "homePage|toastcontainer" text is equal to "Invalid credentials"
#    When User refreshes page
#    And User enters "ikokriashkina@exadel.com" in textboxemail "loginPage|emailfield"
#    And User enters "!qwerty1234" in textboxpassword "loginPage|passwordfield"
#    And User clicks butttonLogin "loginPage|singInButton"
#    Then Tost "homePage|toastcontainer" text is equal to "Please confirm your email!"
#    When User refreshes page
#    And User enters "!qwerty1234" in textboxpassword "loginPage|passwordfield"
#    And User clicks butttonLogin "loginPage|singInButton"
#    Then This element "homePage|errorcontainer" with text "Email is required field!" is displayed

  Scenario: 3: Check Sign Up
    When User navigates to "ILead_SignIn_Page"
    And User clicks link "loginPage|signUp"
    And User clicks button "loginPage|signUpBtn"
    Then This element "loginPage|errorcontainer" with text "First name is required field!" is displayed
    When User enters "Yana" in firstNameFiled "loginPage|firstName"
    And User enters "Kokriashkina" in lastNameFiled "loginPage|lastName"
    And User enters "ikokriashkina@exadel.com" in emailFiled "loginPage|email"
    And User enters "!qwerty1234" in paswwordField "loginPage|password"
    And User enters "qwerty1234" in confirmPaswwordField "loginPage|confirmPassword"
    And User clicks button "loginPage|signUpBtn" by executing script
    Then This element "loginPage|errorcontainer" with text "Passwords do not matched" is displayed
    When User clears text from confirmPaswwordField "loginPage|confirmPassword"
    And User enters "!qwerty1234" in confirmPaswwordField "loginPage|confirmPassword"
    And User clicks button "loginPage|signUpBtn" by executing script
    Then Tost "loginPage|toastcontainer" text is equal to "You've been sent letter to confirm your email. Check your mailbox."


