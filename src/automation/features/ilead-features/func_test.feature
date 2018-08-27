Feature: Check the basics functional

  Background: Login and open home page
    Given User navigates to "ILead_Start_Page"
    When User clicks button "loginPage|goToOlderFormButton"
    When User enters "kokriashkina@exedel.com" in textboxemail "loginPage|emailfield"
    When User enters "12345678" in textboxpassword "#signInPassword"
    When User clicks butttonLogin "loginPage|singInButton"

  Scenario: 1: Check email positive test
    When User enters "dimson.song@gmail.com" in emailbox "homePage|emailcheckfield"
    When User presses Enter key
    Then Result "homePage|toastcontainer" is not displayed
    Then Result "homePage|scoreHolderValue" is displayed
    Then Result "homePage|scoreHolderValue" text is equal to "100"
#
#  Scenario: 2: Check email negative test with not correct email
#    When User enters "dimson.song@gmailcom" in emailbox "homePage|emailcheckfield"
#    When User presses Enter key
#    Then Tost "homePage|toastcontainer" text is equal to "Type correct email!"
#    Then Result "homePage|scoreHolderValue" is not displayed
#
#  Scenario: 3: Check email negative test with empty field
#    When User enters "" in emailbox "homePage|emailcheckfield"
#    When User clicks button "homePage|emailVerifyBtn"
#    Then Tost "homePage|toastcontainer" text is equal to "Type correct email!"
#    Then Result "homePage|scoreHolderValue" is not displayed
#
#  Scenario: 4: Check email positive test with unavailiable email
#    When User enters "john.smith@gmail.com" in emailbox "homePage|emailcheckfield"
#    When User presses Enter key
#    Then Result "homePage|toastcontainer" is not displayed
#    Then Result "homePage|scoreHolderValue" is displayed
#    Then Result "homePage|scoreHolderValue" text is equal to "10"
#
#  Scenario: 5: Check work Recently checked
#    When User enters "john.smith@gmail.com" in emailbox "homePage|emailcheckfield"
#    When User presses Enter key
#    Then Result "homePage|emailItemText" text is equal to "john.smith@gmail.com"
#    When User refreshes page
#    Then Result "homePage|emailItemText" text is equal to "john.smith@gmail.com"
#
#  Scenario: 6: Check companies positive case
#    When User clicks button "homePage|mainMenuLink" with text "Companies"
#    When User enters "example.com" in TextBox "homePage|companiesIP"
#    When User presses Enter key
#    Then Attribute "class" of resultblock "homePage|resultContainer" is equal to "section-content"
#    Then Result "homePage|boxMainName" text is equal to "Trackphonulously"
#    When User refreshes page
#    Then User enters "samsung.com" in TextBox "homePage|companiesIP"
#    When User presses Enter key
#    Then Result "homePage|boxMain" text is equal to "SAMSUNG"
#
#  Scenario: 7:Check companies negative case
#    When User clicks button "homePage|mainMenuLink" with text "Companies"
#    When User enters "" in TextBox "homePage|companiesIP"
#    When User clicks button "homePage|hideIfLoadingButton"
#    Then Tost "homePage|toastcontainer" text is equal to "Enter the field"
#    When User enters "samsung" in TextBox "homePage|companiesIP"
#    When User presses Enter key
#    Then Result "homePage|boxMain" text is equal to ""
#    When User refreshes page
#    When User enters "samsung.com" in TextBox "homePage|companiesIP"
#    When User presses Enter key
#    Then Result "homePage|boxMain" text is equal to "SAMSUNG"
#
#  Scenario: 8:Check bulk checker functional
#    When User clicks button "homePage|maintabsitem" with text "Bulk checker"
#    When User clicks listItem "homePage|listItemName" with text "Emails Bulk(166).csv"
#    When User clicks checkbox "homePage|checkFieldIndicator" on row "homePage|listHolder"
#    When User clicks button "homePage|addLeads"
#    When User clicks button "homePage|mainMenuLink" with text "Contacts"
#    Then Field "homePage|statusCheckboxInput" text is not equal to ""
#    Then Table "homePage|listHolder" is enabled
#    Given User navigates to "ILead_Home_Page"
#    When User clicks button "homePage|maintabsitem" with text "Bulk checker"
#    When User enters "ferens.dmitro@yandex.ru" in TextBox "homePage|textList"
#    When User presses Enter key
#    When User enters "dimson.song@example.com" in TextBox "homePage|textList"
#    When User presses Enter key
#    When User enters "somthingemail@gmail.com" in TextBox "homePage|textList"
#    When User clicks button "homePage|createNewVerificationBulkBtn"
#    When User waits 10 seconds
#    When User refreshes page
#    When User clicks 1 item in "homePage|listItemValue" collection
#    Then EmailFilter "homePage|checkFieldTitle" text is equal to "100 % (2)"
#
#  Scenario: 9:Check create key for use API
#    When User clicks button "homePage|maintabsitem" with text "Use API"
#    When User clicks button "homePage|createKeyBtn"
#    Then Result "homePage|keysContainer" is displayed

