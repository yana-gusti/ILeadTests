Feature: Check the basics functional

  Background: Login and open home page
    Given User navigates to "ILead_SignIn_Page"
    When User clicks button "loginPage|goToOlderFormButton"
    When User enters "kokriashkina@exedel.com" in textboxemail "loginPage|emailfield"
    When User enters "12345678" in textboxpassword "loginPage|passwordfield"
    When User clicks butttonLogin "loginPage|singInButton"

  Scenario: 1: Check email positive test
    When User enters "dimson.song@gmail.com" in emailbox "homePage|emailcheckfield"
    When User presses Enter key
    Then Result "homePage|toastcontainer" is not displayed
    Then Result "homePage|scoreHolderValue" is displayed
    Then Result "homePage|scoreHolderValue" text is equal to "100"
    When User clicks button "homePage|logout"

  Scenario: 2: Check email negative test with not correct email
    When User enters "dimson.song@gmailcom" in emailbox "homePage|emailcheckfield"
    When User presses Enter key
    Then Tost "homePage|toastcontainer" text is equal to "Type correct email!"
    Then Result "homePage|scoreHolderValue" is not displayed
    When User clicks button "homePage|logout"

  Scenario: 3: Check email negative test with empty field
    When User enters "" in emailbox "homePage|emailcheckfield"
    When User clicks button "homePage|emailVerifyBtn"
    Then Tost "homePage|toastcontainer" text is equal to "Type correct email!"
    Then Result "homePage|scoreHolderValue" is not displayed
    When User clicks button "homePage|logout"

  Scenario: 4: Check email positive test with unavailiable email
    When User enters "john.smith@gmail.com" in emailbox "homePage|emailcheckfield"
    When User presses Enter key
    Then Result "homePage|toastcontainer" is not displayed
    Then Result "homePage|scoreHolderValue" is displayed
    Then Result "homePage|scoreHolderValue" text is equal to "10"
    When User clicks button "homePage|logout"

  Scenario: 5: Check work Recently checked
    When User enters "john.smith@gmail.com" in emailbox "homePage|emailcheckfield"
    When User presses Enter key
    When User refreshes page
    Then Result "homePage|emailItemText" text is equal to "john.smith@gmail.com"
    When User refreshes page
    Then Result "homePage|emailItemText" text is equal to "john.smith@gmail.com"
    When User clicks button "homePage|logout"

  Scenario: 6: Check companies positive case
    When User clicks button "homePage|mainMenuLink" with text "Companies"
    When User enters "example.com" in TextBox "homePage|companiesIP"
    When User presses Enter key
    Then Attribute "class" of resultblock "homePage|resultContainer" is equal to "section-content"
    Then Result "homePage|boxMainName" text is equal to "Trackphonulously"
    When User refreshes page
    Then User enters "samsung.com" in TextBox "homePage|companiesIP"
    When User presses Enter key
    Then Result "homePage|boxMain" text is equal to "SAMSUNG"
    When User clicks button "homePage|logout"

  Scenario: 7:Check companies negative case
    When User clicks button "homePage|mainMenuLink" with text "Companies"
    When User enters "" in TextBox "homePage|companiesIP"
    When User clicks button "homePage|hideIfLoadingButton"
    Then Tost "homePage|toastcontainer" text is equal to "Enter the field"
    When User enters "samsung" in TextBox "homePage|companiesIP"
    When User presses Enter key
    Then Result "homePage|boxMain" text is equal to ""
    When User refreshes page
    When User enters "samsung.com" in TextBox "homePage|companiesIP"
    When User presses Enter key
    Then Result "homePage|boxMain" text is equal to "SAMSUNG"
    When User clicks button "homePage|logout"

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
#    When User refreshes page
#    Then EmailFilter "homePage|checkFieldTitle" text is equal to "100 % (2)"
#    When User clicks button "homePage|logout"

  Scenario: 9:Check create key for use API
    When User clicks button "homePage|maintabsitem" with text "Use API"
    When User clicks button "homePage|createKeyBtn"
    Then Result "homePage|keysContainer" is displayed
    When User clicks button "homePage|logout"

  Scenario: 10:Check UI home page
    When User clicks button "homePage|maintabsitem" with text "Bulk checker"
    When User clicks button "homePage|maintabsitem" with text "Use API"
    When User clicks button "homePage|maintabsitem" with text "Check email"
    Then Button "homePage|hideIfLoadingButton" text is equal to "Check"
    Then Attribute "placeholder" of field "homePage|emailcheckfield" is equal to "mail@example.com"
    Then Menu "homePage|emailsMenu" text is equal to "Emails"
    Then Menu "homePage|companiesMenu" text is equal to "Companies"
    Then Menu "homePage|contactsMenu" text is equal to "Contacts"
    When User clicks menu "homePage|secondarymenulink" with text "API"
    When User goes to 1 browser tab
    Then Menu "homePage|logout" text is equal to "Sign out"
    When User clicks menu "homePage|companiesMenu"
    Then Button "homePage|hideIfLoading" text is equal to "Check"
    Then Attribute "placeholder" of field "homePage|companiesIP" is equal to "example.com"
    When User clicks menu "homePage|emailsMenu"
    When User clicks button "homePage|maintabsitem" with text "Bulk checker"
    Then Button "homePage|selectFileBtn" text is equal to "Click here to select file"
    Then Attribute "placeholder" of field "homePage|textList" is equal to "mail@example.com"
    When User clicks button "homePage|logout"

#  Scenario: 11:Check downoloads file
#    When User clicks button "homePage|mainMenuLink" with text "Contacts"
#    When User clicks button "homePage|saveAsCsv"
#    Then Downloaded file with name contains "iLead_contacts_.csv" exists
#    When User clicks button "homePage|mainMenuLink" with text "Emails"
#    When User clicks button "homePage|maintabsitem" with text "Bulk checker"
#    When User clicks listItem "homePage|listItemName" with text "Emails Bulk(192).csv"
#    When User clicks button "homePage|saveAsCsv"
#    Then Downloaded file with name contains "Emails Bulk(192),.csv" exists
#    When User clicks button "homePage|logout"

  Scenario: 12: Check domain search(positive and negativ case)
    When User clicks button "homePage|maintabsitem" with text "Domain search"
    When User clicks button "homePage|domainSearchBtn"
    Then Tost "homePage|toastcontainer" text is equal to "Type domain, please!"
    When User enters "samsung.com" in TextBox "homePage|domainSearchInpt"
    When User clicks button "homePage|domainSearchBtn"
    Then Span "homePage|count" text is equal to "0"
    When User clears text from field "homePage|domainSearchInpt"
    When User enters "gmail.com" in TextBox "homePage|domainSearchInpt"
    When User clicks button "homePage|domainSearchBtn"
    Then Span "homePage|count" text is not equal to "0"
    When User clicks button "homePage|logout"
