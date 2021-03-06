*** Settings ***

Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource      ../common.robot
Resource      ../IOS_PO/ios_main_menu.robot

*** Variables ***


*** Keywords ***
Go_Paperless_All_Account
     set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    AppiumLibrary.click element  id=action_menu
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    AppiumLibrary.click element  xpath=//*[contains(@text,'Statements & Documents')]
    scroll down to view  xpath=//*[contains(@text,'Go Paperless')]
    AppiumLibrary.click element  xpath=//*[contains(@text,'Go Paperless')]
    AppiumLibrary.wait until element is visible  xpath=//android.widget.RadioButton[1]
    AppiumLibrary.click element  xpath=//android.widget.RadioButton[1]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'The following accounts are now Paperless!')]
    AppiumLibrary.click element  id=bt_continue
    # go to ROB
Go_Paperless_Any_Account
     set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    AppiumLibrary.click element  id=action_menu
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    AppiumLibrary.click element  xpath=//*[contains(@text,'Statements & Documents')]
    scroll down to view  xpath=//*[contains(@text,'Go Paperless')]
    AppiumLibrary.click element  xpath=//*[contains(@text,'Go Paperless')]
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'Select Accounts To Go Paperless')]
    AppiumLibrary.click element  xpath=//android.widget.RadioButton[5]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible  id=button1
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  id=button1
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    # go to ROB

Help_Options
    set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    ios_main_menu.Go TO Help
    AppiumLibrary.click element  name=Using the App
    AppiumLibrary.wait until element is visible  name=What can I do using Mobile Banking?
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  name=Using the App
    AppiumLibrary.wait until element is visible  name=Mobile Check Deposit
    AppiumLibrary.click element  name=Mobile Check Deposit
    AppiumLibrary.wait until element is visible  What is Mobile Check Deposit?
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  name=Mobile Check Deposit
    AppiumLibrary.capture page screenshot
    AppiumLibrary.wait until element is visible  name=Transfers
    AppiumLibrary.click element  name=Transfers
    AppiumLibrary.wait until element is visible  name=How can I transfer money to someone else?
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  name=Transfers
    AppiumLibrary.wait until element is visible  name=Credit Cards
    AppiumLibrary.click element  name=Credit Cards
    AppiumLibrary.wait until element is visible   What is AutoPay?
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  Credit Cards
    AppiumLibrary.wait until element is visible   Touch ID
     AppiumLibrary.click element  Touch ID
    AppiumLibrary.wait until element is visible   What is Touch ID?
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  Touch ID
    AppiumLibrary.wait until element is visible  Quick Balance
    AppiumLibrary.click element  Quick Balance
    AppiumLibrary.wait until element is visible   How can I see my selected accounts?
    #AppiumLibrary.wait until element is visible  Quick Balance is a feature that allows you to see your balances for up to three selected accounts without logging in. This is an optional feature and if you choose to use this feature, you are required to activate and select the accounts for which you like to view without logging in.
    #AppiumLibrary.click element   //XCUIElementTypeNavigationBar[@name="Help"]/XCUIElementTypeButton[2]
    AppiumLibrary.wait until element is visible  Quick Balance
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  Quick Balance
    AppiumLibrary.wait until element is visible   Forgot your Password
    AppiumLibrary.click element   Forgot your Password
    AppiumLibrary.wait until element is visible   What is Forgot Password?
    AppiumLibrary.capture page screenshot
    AppiumLibrary.wait until element is visible   Branch/ATM locator
    AppiumLibrary.click element   Branch/ATM locator
    AppiumLibrary.wait until element is visible   What do the colored icons on the Locations page represent?