*** Settings ***

Library          AppiumLibrary
Resource        ../IOS_PO/ios_main_menu.robot
Resource        ../common.robot
*** Variables ***


*** Keywords ***
Validate Options
    set appium timeout  30 seconds
    ios_main_menu.go to help
    AppiumLibrary.click element   name=Using the App
    AppiumLibrary.wait until element is visible    name=What can I do using Mobile Banking?
    AppiumLibrary.page should contain text   Is Mobile Banking secure?
    AppiumLibrary.page should contain text   Do I need to be registered to use Mobile Banking?
    AppiumLibrary.page should contain text   How do I login to Mobile Banking?
    AppiumLibrary.page should contain text   Who can I contact if I have questions about Mobile Banking?
    AppiumLibrary.page should contain text   How do I register for Online Banking?
    AppiumLibrary.page should contain text   How can I remove my User ID from this device?
    AppiumLibrary.click element   name=Using the App
    AppiumLibrary.wait until element is visible  name=Mobile Check Deposit
    AppiumLibrary.click element   name=Mobile Check Deposit
    AppiumLibrary.wait until element is visible   name=What is Mobile Check Deposit?
    AppiumLibrary.page should contain element  name=Is Mobile Check Deposit safe?
    AppiumLibrary.page should contain element   name=When can deposits be made?
    AppiumLibrary.page should contain element   name=What accounts are eligible?
    AppiumLibrary.page should contain element   name=Is there a fee for using the service?
    AppiumLibrary.page should contain element   name=What types of checks are accepted?
    AppiumLibrary.page should contain element   name=Are there limits to Mobile Check Deposit?
    AppiumLibrary.page should contain element   name=When will deposits be available?
    common.scroll down to view       name=How do I endorse a check?
    AppiumLibrary.page should contain element    name=How do I endorse a check?
    AppiumLibrary.page should contain element    name=How do I take a good picture of the check?
    AppiumLibrary.page should contain element    name=What to do with check after I deposit it?
    AppiumLibrary.swipe  1000  614  0  300  1000
    AppiumLibrary.wait until element is visible   name=Is Mobile Check Deposit safe?
    AppiumLibrary.click element   name=Mobile Check Deposit
    AppiumLibrary.wait until element is visible    name=Transfers
    AppiumLibrary.click element   name=Transfers
    AppiumLibrary.wait until element is visible    name=How can I transfer money to someone else?
    AppiumLibrary.page should contain element    name=Can I transfer money to non-Santander customers?
    AppiumLibrary.capture page screenshot
    AppiumLibrary.page should contain element    name=What is OTP?
    AppiumLibrary.page should contain element    name=How quickly will I receive a One-Time Passcode (OTP) via text message?
    AppiumLibrary.page should contain element    name=Will it cost me anything to receive a text message containing a One-Time Passcode (OTP)
    AppiumLibrary.click element   name=Transfers
    AppiumLibrary.wait until element is visible     name=Credit Cards
    AppiumLibrary.click element    name=Credit Cards
    AppiumLibrary.wait until element is visible   What is AutoPay?
    AppiumLibrary.page should contain element     What is the Instant Card Hold feature?
    AppiumLibrary.page should contain element     How long do Credit Card payments take?
    AppiumLibrary.page should contain element     How do I make a Credit Card Payment?
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element    name=Credit Cards
    AppiumLibrary.wait until element is visible     name=Touch ID
    AppiumLibrary.click element   name=Touch ID
    AppiumLibrary.wait until element is visible    name=What is Touch ID?
    AppiumLibrary.page should contain element   How to set up Touch ID?
    AppiumLibrary.page should contain element    How to disable Touch ID login?
    AppiumLibrary.page should contain element    What should I know about Touch ID?
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   name=Touch ID
    AppiumLibrary.click element    Quick Balance
    AppiumLibrary.wait until element is visible   What is Quick Balance?
    AppiumLibrary.page should contain element    How can I see my selected accounts?
    AppiumLibrary.page should contain element    How my accounts are presented in the home screen?
    common.scroll down to view           name=Forgot your Password
    AppiumLibrary.page should contain element   How to set up Quick Balance?
    AppiumLibrary.page should contain element   How to disable Quick Balance?
    AppiumLibrary.page should contain element   What should I know about Quick Balance?
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element    Quick Balance
    AppiumLibrary.click element     name=Forgot your Password
    AppiumLibrary.wait until element is visible     name=What is Forgot Password?
    AppiumLibrary.page should contain element       How can I reset my Password?
    AppiumLibrary.click element     name=Forgot your Password
    AppiumLibrary.wait until element is visible   Branch/ATM locator
    AppiumLibrary.click element   Branch/ATM locator
    AppiumLibrary.wait until element is visible   What do the colored icons on the Locations page represent?
    AppiumLibrary.capture page screenshot
