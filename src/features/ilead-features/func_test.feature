Feature: Check the basics functional

  Background: Login and open home page
    Given User navigates to "ILead_Start_Page"
    When User enters "kokriashkina@exedel.com" in textboxemail "loginPage|emailfield"
    When User enters "12345678" in textboxpassword "loginPage|passwordfield"
    When User clicks butttonLogin "loginPage|singInButton"

  Scenario: 1: Check email positive test
    When User enters "dimson.song@gmail.com" in emailbox "homePage|emailcheckfield"
    And User presses Enter key
    Then Result "homePage|toastcontainer" is not displayed
    And Result "homePage|scoreHolderValue" is displayed
    And Result "homePage|scoreHolderValue" text is equal to "100"

    Scenario: 2: Check email negative test with not correct email
    When User enters "dimson.song@gmailcom" in emailbox "homePage|emailcheckfield"
    And User presses Enter key
    Then Tost "homePage|toastcontainer" text is equal to "Type correct email!"
    And Result "homePage|scoreHolderValue" is not displayed

  Scenario: 3: Check email negative test with empty field
    When User enters "" in emailbox "homePage|emailcheckfield"
    And User clicks button "homePage|emailVerifyBtn"
    Then Tost "homePage|toastcontainer" text is equal to "Type correct email!"
    And Result "homePage|scoreHolderValue" is not displayed

  Scenario: 4: Check email positive test with unavailiable email
    When User enters "john.smith@gmail.com" in emailbox "homePage|emailcheckfield"
    And User presses Enter key
    Then Result "homePage|toastcontainer" is not displayed
    And Result "homePage|scoreHolderValue" is displayed
    When User waits 3 seconds
    Then Result "homePage|scoreHolderValue" contains "10" text

  Scenario: 5: Check work Recently checked
    When User enters "john.smith@gmail.com" in emailbox "homePage|emailcheckfield"
    And User presses Enter key
    And User refreshes page
    Then Result "homePage|emailItemText" text is equal to "john.smith@gmail.com"
    When User refreshes page
    Then Result "homePage|emailItemText" text is equal to "john.smith@gmail.com"

  Scenario: 6: Check companies positive case
    When User clicks button "homePage|mainMenuLink" with text "Companies"
    And User enters "example.com" in TextBox "homePage|companiesIP"
    And User presses Enter key
    Then Attribute "class" of resultblock "homePage|resultContainer" is equal to "section-content"
    And Result "homePage|boxMainName" text is equal to "Trackphonulously"
    When User refreshes page
    Then User enters "samsung.com" in TextBox "homePage|companiesIP"
    When User presses Enter key
    Then Result "homePage|boxMain" text is equal to "SAMSUNG"

  Scenario: 7:Check companies negative case
    When User clicks button "homePage|mainMenuLink" with text "Companies"
    And User enters "" in TextBox "homePage|companiesIP"
    And User clicks button "homePage|hideIfLoadingButton"
    Then Tost "homePage|toastcontainer" text is equal to "Enter the field"
    When User enters "samsung" in TextBox "homePage|companiesIP"
    And User presses Enter key
    Then Error message "homePage|errorMessage" text is equal to "Please input correct company domain name. Example: ilead.io"
    When User refreshes page
    And User enters "samsung.com" in TextBox "homePage|companiesIP"
    And User presses Enter key
    Then Result "homePage|boxMain" text is equal to "SAMSUNG"

  Scenario: 8:Check bulk checker functional
    When User clicks button "homePage|maintabsitem" with text "Bulk checker"
    And User clicks listItem "homePage|listItemName" with text "Emails Bulk(166).csv"
    And User clicks checkbox "homePage|checkFieldIndicator" on row "homePage|listHolder"
    And User clicks button "homePage|addLeads"
    And User clicks button "homePage|mainMenuLink" with text "Contacts"
    Then Field "homePage|statusCheckboxInput" text is not equal to ""
    And Table "homePage|listHolder" is enabled
    Given User navigates to "ILead_Home_Page"
    When User clicks button "homePage|maintabsitem" with text "Bulk checker"
    And User enters "ferens.dmitro@yandex.ru" in TextBox "homePage|textList"
    And User presses Enter key
    And User enters "dimson.song@example.com" in TextBox "homePage|textList"
    And User presses Enter key
    And User enters "somthingemail@gmail.com" in TextBox "homePage|textList"
    And User clicks button "homePage|createNewVerificationBulkBtn"
    And User waits 10 seconds
    And User refreshes page
    And User clicks 1 item in "homePage|listItemValue" collection
    And User refreshes page
    Then EmailFilter "homePage|checkFieldTitle" text is equal to "100 % (2)"

  Scenario: 9:Check create key for use API
    When User clicks button "homePage|useApiMenu" with text "Use API"
    And User clicks button "homePage|createKeyBtn"
    And User waits 4 seconds
    Then Result "homePage|keysContainer" is displayed

  Scenario: 10:Check UI home page
    When User clicks button "homePage|maintabsitem" with text "Bulk checker"
    And User clicks button "homePage|useApiMenu" with text "Use API"
    And User clicks button "homePage|emailsMenu" with text "Emails"
    And User clicks button "homePage|maintabsitemone" with text "Check email"
    And User waits 5 seconds
    Then Button "homePage|hideIfLoadingButton" text is equal to "Check"
    And Attribute "placeholder" of field "homePage|emailcheckfield" is equal to "Enter an email address to validate it."
    And Menu "homePage|emailsMenu" text is equal to "Emails"
    And Menu "homePage|companiesMenu" text is equal to "Companies"
    And Menu "homePage|contactsMenu" text is equal to "Contacts"
    When User clicks menu "homePage|secondarymenulink" with text "API"
    And User goes to 1 browser tab
    And User waits 3 seconds
    Then Menu "homePage|logout" text is equal to "Sign out"
    When User clicks menu "homePage|companiesMenu"
    Then Button "homePage|emailVerifyBtn" text is equal to "Check"
    And Attribute "placeholder" of field "homePage|companiesIP" is equal to "example.com"
    When User clicks menu "homePage|emailsMenu"
    And User clicks button "homePage|maintabsitem" with text "Bulk checker"
    Then Button "homePage|selectFileBtn" text is equal to "Click here to select file"
    And Attribute "placeholder" of field "homePage|textList" is equal to "mail@example.com"

  Scenario: 11:Check downoloads file
    When User clicks button "homePage|mainMenuLink" with text "Contacts"
    And User clicks button "homePage|saveAsCsv"
    Then Downloaded file with name contains "iLead_contacts_.csv" exists
    When User clicks button "homePage|mainMenuLink" with text "Emails"
    And User clicks button "homePage|maintabsitem" with text "Bulk checker"
    And User clicks listItem "homePage|listItemName" with text "Emails Bulk(192).csv"
    And User clicks button "homePage|saveAsCsv"
    Then Downloaded file with name contains "Emails Bulk(192),.csv" exists