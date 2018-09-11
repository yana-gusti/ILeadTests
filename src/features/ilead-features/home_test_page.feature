Feature: Check home page

  Scenario: 1: Check the main heading and email verification field
    Given User navigates to "ILead_Main_Page"
    Then Header "mainPage|mainHeader" text is equal to "Free email verification"
    When User enters "zinichuzh@gmail.com" in field "mainPage|searchField"
    When User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
    When User waits 3 seconds
    Then Result "mainPage|verifiedResult" contains "zinichuzh@gmail.com Mailbox exists! You can confidently send mail" text

  Scenario: 2: Check email negative test with incorrect email
    Given User navigates to "ILead_Main_Page"
    When User enters "zinichuzh@gmail" in field "mainPage|searchField"
    When User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
    Then Result "mainPage|errorField" contains "It doesn't look like correct email" text

  Scenario: 3: Check email negative test with empty field
    Given User navigates to "ILead_Main_Page"
    When User enters "" in field "mainPage|searchField"
    When User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
    Then Result "mainPage|errorField" contains "It doesn't look like correct email" text

  Scenario: 4: Testing of main header content
    Given User navigates to "ILead_Main_Page"
    Given User navigates to "ILead_Main_Page"
    When User clicks button "mainPage|companiesBtn"
    When User enters "samsung.com" in field "mainPage|searchField"
    When User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
    When User waits 4 seconds
    Then Result "mainPage|companiesSearchRes" contains "Samsung Electronics Co. Ltd" text
    When User clicks button "mainPage|companiesBtn"
    When User enters "samsung" in field "mainPage|searchField"
    When User clicks button "mainPage|checkEmailButton" on section "mainPage|emailVerifySection"
    When User waits 4 seconds
    Then Result "mainPage|errorField" contains "It doesn't look like correct domain" text
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

  Scenario: 5: Testing the subscribe form in footer
    Given User navigates to "ILead_Main_Page"
    When User enters "sergey.com@mail.ru" in field "mainPage|subscrField"
    When User clicks button "mainPage|subscrBtn" on section "mainPage|mainFooter"
    When User waits 5 seconds
    Then Result "mainPage|subscrResult" contains "Please check your inbox or spam folder" text
    When User refreshes page
    When User enters "sergey.com@mail." in field "mainPage|subscrField"
    When User clicks button "mainPage|subscrBtn" on section "mainPage|mainFooter"
    Then Result "mainPage|subscrError" contains "It doesn't look like correct email" text

  Scenario: 6: Feedback button testing
    Given User navigates to "ILead_Main_Page"
    When User waits 2 seconds
    When User clicks icon "mainPage|feedbackIcon"
    Then Icon "mainPage|emotionsIcon" is displayed
    When User clicks icon "mainPage|loveEmotion"
    When User enters "TEST" in field "mainPage|commentField"
    When User clicks button "mainPage|sendBtn"
    When User clicks button "mainPage|skipBtn"
    Then Icon "._hj-f5b2a1eb-9b07_wordwrap" with text "Thank you for sharing your feedback with us!" is displayed

