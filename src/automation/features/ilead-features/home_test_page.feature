Feature: Check home page

  Scenario: 1: Check the main heading and email verification field
    Given User navigates to "ILead_Main_Page"
    Then Header "mainPage|mainHeader" text is equal to "Free email verification"
    When User enters "zinichuzh@gmail.com" in field "mainPage|searchField"
    When User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
    When User waits 3 seconds
    Then Result "mainPage|verifiedResult" contains "zinichuzh@gmail.com Mailbox exists! You can confidently send mail" text
    When User clears text from field "mainPage|searchField"
    When User enters "zinichuzh@gmail" in field "mainPage|searchField"
    When User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
    Then Result "mainPage|errorField" contains "It doesn't look like correct email" text

  Scenario: 2: Testing of main header content
    Given User navigates to "ILead_Main_Page"
    When User clicks button "mainPage|tryIleadBtn"
    Then Page URL is equal to "https://app.ilead.io/#signIn"
    Given User navigates to "ILead_Main_Page"
#    When User clicks button "mainPage|companiesBtn"
#    When User enters "samsung.com" in field "mainPage|searchField"
#    When User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
#    When User waits 4 seconds
#    Then Result "mainPage|companiesSearchRes" contains "Samsung Electronics Co. Ltd" text
#    When User clicks button "mainPage|companiesBtn"
#    When User enters "samsung" in field "mainPage|searchField"
#    When User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
#    When User waits 4 seconds
#    Then Result "mainPage|errorField" contains "It doesn't look like correct domain" text
    When User clicks button "mainPage|headerMenu" with text "Categories"
    Then Header "mainPage|mainHeader" text is equal to "Companies directory"
    When User clicks button "mainPage|headerMenu" with text "Blog"
    Then Page "mainPage|blogPage" is displayed
    When User clicks button "mainPage|headerMenu" with text "Pricing"
    Then Page "mainPage|pricingPage" is displayed
    Then Field "mainPage|nameField" is empty
    Then Field "mainPage|mailField" is empty
    Then Field "mainPage|messageField" is empty
    Then Button "mainPage|subscribeBtn" with text "Subscribe" on page "mainPage|pricingPage" with text "Send special or enterprise requests" is displayed
    When User clicks button "mainPage|headerMenu" with text "API"
    Then Header "mainPage|mainHeader" text is equal to "Documentation"
    Then Navigation list "mainPage|navigationList" is not empty
    Then Section content "mainPage|sectionContent" is not empty
    When User clicks button "mainPage|headerMenu" with text "Sign In"
    Then Page "mainPage|authPage" is displayed
    Then Button "mainPage|authBtn" is displayed

  Scenario: 3: Testing the subscribe form in footer
    Given User navigates to "ILead_Main_Page"
    When User enters "sergey.com@mail.ru" in field "mainPage|subscrField"
    When User clicks button "mainPage|subscrBtn" on section "mainPage|mainFooter"
    When User waits 5 seconds
    Then Result "mainPage|subscrResult" contains "Please check your inbox or spam folder" text
    When User refreshes page
    When User enters "sergey.com@mail." in field "mainPage|subscrField"
    When User clicks button "mainPage|subscrBtn" on section "mainPage|mainFooter"
    Then Result "mainPage|subscrError" contains "It doesn't look like correct email" text

#  Scenario: 4: Testing help icon
#    Given User navigates to "ILead_Main_Page"
#    When User waits 4 seconds
#    Then Icon ".ztb-fbc-iconicstyle" is displayed
#    When User clicks button ".promptButtonContainer"
#    Then Page URL is equal to "https://www.facebook.com/plugins/live_chat/continue_as/?page_id=1545384755505147&request_id=4fbab017-8e5e-6038-0ea3-fec16383d033#_=_"


