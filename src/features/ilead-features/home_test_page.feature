Feature: Check home page

  Scenario: 1: Check the main heading and email verification field
    When User navigates to "ILead_Main_Page"
    Then Header "mainPage|mainHeader" text is equal to "Email verification"
    When User enters "zinichuzh@gmail.com" in field "mainPage|searchField"
    And User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
    And User waits 3 seconds
    Then Result "mainPage|verifiedResult" contains "zinichuzh@gmail.com Mailbox exists. You can confidently send emails" text

  Scenario: 2: Check email negative test with incorrect email
    When User navigates to "ILead_Main_Page"
    And User enters "zinichuzh@gmail" in field "mainPage|searchField"
    And User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
    Then Result "mainPage|errorField" contains "It doesn't look like correct email" text

  Scenario: 3: Check email negative test with empty field
    When User navigates to "ILead_Main_Page"
    And User enters "" in field "mainPage|searchField"
    And User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
    Then Result "mainPage|errorField" contains "It doesn't look like correct email" text

  Scenario: 4: Testing of main header content
    When User navigates to "ILead_Main_Page"
    And User clicks button "mainPage|companiesBtn"
    And User enters "samsung.com" in field "mainPage|searchField"
    And User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
    And User waits 4 seconds
    Then Result "mainPage|companiesSearchRes" contains "Samsung Electronics Co. Ltd" text
    When User clicks button "mainPage|companiesBtn"
    And User enters "samsung" in field "mainPage|searchField"
    And User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
    And User waits 4 seconds
    Then Result "mainPage|errorField" contains "It doesn't look like correct domain" text
    When User clicks button "mainPage|headerMenu" with text "Categories"
    Then Header "mainPage|mainHeader" text is equal to "Companies directory"
    When User clicks button "mainPage|headerMenu" with text "Blog"
    Then Page "mainPage|blogPage" is displayed
    When User clicks button "mainPage|headerMenu" with text "Pricing"
    Then Page "mainPage|pricingPage" is displayed
    And Field "mainPage|nameField" is empty
    And Field "mainPage|mailField" is empty
    And Field "mainPage|messageField" is empty
    And Button "mainPage|checkEmailButton" with text "SEND REQUEST" is displayed
    When User clicks button "mainPage|headerMenu" with text "API"
    Then Header "mainPage|mainHeader" text is equal to "Documentation"
    And Navigation list "mainPage|navigationList" is not empty
    And Section content "mainPage|sectionContent" is not empty
    When User clicks button "mainPage|headerMenu" with text "Sign In"
    Then Page "mainPage|authPage" is displayed
    And Button "mainPage|authBtn" is displayed

  Scenario: 5: Testing the subscribe form in footer
    When User navigates to "ILead_Main_Page"
    And User enters "sergey.com@mail.ru" in field "mainPage|subscrField"
    And User clicks button "mainPage|subscrBtn" on section "mainPage|mainFooter"
    And User waits 5 seconds
    Then Result "mainPage|subscrResult" contains "Please check your inbox or spam folder" text
    When User refreshes page
    And User enters "sergey.com@mail." in field "mainPage|subscrField"
    And User clicks button "mainPage|subscrBtn" on section "mainPage|mainFooter"
    Then Result "mainPage|subscrError" contains "It doesn't look like correct email" text

#  Scenario: 6: Feedback button testing
#    Given User navigates to "ILead_Main_Page"
#    When User waits 2 seconds
#    When User clicks icon "mainPage|feedbackIcon"
#    Then Icon "mainPage|emotionsIcon" is displayed
#    When User clicks icon "mainPage|loveEmotion"
#    When User enters "TEST" in field "mainPage|commentField"
#    When User clicks button "mainPage|sendBtn"
#    When User clicks button "mainPage|skipBtn"
#    Then Icon "._hj-f5b2a1eb-9b07_wordwrap" with text "Thank you for sharing your feedback with us!" is displayed

