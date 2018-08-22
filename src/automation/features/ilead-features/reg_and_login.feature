Feature: Check login and registration functional

  Scenario: 1: Check login positiv case
    Given User navigates to "ILead_Start_Page"
    When User clicks button "loginPage|goToOlderFormButton"
    When User enters "kokriashkina@exedel.com" in textboxemail "loginPage|emailfield"
    When User enters "12345678" in textboxpassword "loginPage|passwordfield"
    When User clicks butttonLogin "loginPage|singInButton"
    Then Page URL is equal to "ILead_Home_Page"

  Scenario: 2: Check login negative case
    Given User navigates to "ILead_Start_Page"
    When User clicks button "loginPage|goToOlderFormButton"
    When User clicks butttonLogin "loginPage|singInButton"
    Then Tost "homePage|toastcontainer" text is equal to "Bad Request"
    When User enters "test@exedel.com" in textboxemail "loginPage|emailfield"
    When User enters "12345678" in textboxpassword "loginPage|passwordfield"
    When User clicks butttonLogin "loginPage|singInButton"
    Then Page URL is equal to "ILead_Main_Page"
    Given User navigates to "ILead_Start_Page"
    When User clicks button "loginPage|goToOlderFormButton"
    When User enters "ikokriashkina@exadel.com" in textboxemail "loginPage|emailfield"
    When User enters "!qwerty1234" in textboxpassword "loginPage|passwordfield"
    When User clicks butttonLogin "loginPage|singInButton"
    Then Tost "homePage|toastcontainer" text is equal to "Please confirm your email!"
    When User refreshes page
    When User enters "!qwerty1234" in textboxpassword "loginPage|passwordfield"
    When User clicks butttonLogin "loginPage|singInButton"
    Then Tost "homePage|toastcontainer" text is equal to "Bad Request"

  Scenario: 3: Check Sign In
    Given User navigates to "ILead_Start_Page"
    When User clicks button "loginPage|goToOlderFormButton"
    When User clicks button "loginPage|authNavItem" with text "Sign Up"
    When User clicks button "loginPage|signUpBtn"
    Then Tost "homePage|toastcontainer" text is equal to "Please, enter an corporate email"
    When User enters "Yana" in firstNameFiled "loginPage|firstName"
    When User enters "Kokriashkina" in lastNameFiled "loginPage|lastName"
    When User enters "ikokriashkina@exadel.com" in emailFiled "loginPage|email"
    When User enters "!qwerty1234" in paswwordField "loginPage|password"
    When User enters "qwerty1234" in confirmPaswwordField "loginPage|confirmPassword"
    When User clicks button "loginPage|signUpBtn"
    Then Tost "homePage|toastcontainer" text is equal to "Passwords do not match"
    When User clears text from confirmPaswwordField "loginPage|confirmPassword"
    When User enters "!qwerty1234" in confirmPaswwordField "loginPage|confirmPassword"
    When User clicks button "loginPage|signUpBtn"
    Then Tost "homePage|toastcontainer" text is equal to "Record with such data is already exists"

#  Scenario: 4:

