*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource       ../Shared_Keywords.robot
Resource       ../Android_PO/main_menu.robot
Resource       ../Android_PO/login.robot
*** Keywords ***


Checking Account
     set appium timeout  30 seconds
    [Arguments]  ${amount}
    #scroll element down to view
    select quickbalance account   ${amount}
    Validate QuickBalance Success Message
    Log Off To Quick Settings

Validate Account in Quick Settings
    [Arguments]  ${account}
    AppiumLibrary.wait until element is visible  id=iv_quick_balance
    AppiumLibrary.click element  id=iv_quick_balance
    AppiumLibrary.wait until page contains   ${account}
    get screenshot
log in quick settings
    [Arguments]  ${answer}  ${password}
    AppiumLibrary.click element    bt_logon
     Add Login Answer  ${answer}
     Add Login Password  ${password}


Select QuickBalance Account
    [Arguments]  ${account}
    go to quick balance
    AppiumLibrary.wait until page contains  Select up to three accounts to see balances before you log in. Deselect accounts to turn off pre-login balances.
    AppiumLibrary.get current context
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'${account}')]/../android.widget.CheckBox[1]
    AppiumLibrary.click element   id=bt_continue
    #cb_account
Validate QuickBalance Success Message
    AppiumLibrary.wait until page contains   Congratulations! You're all set to use Quick Balance
    get screenshot
     AppiumLibrary.click element   id=bt_continue
     AppiumLibrary.wait until element is visible    id=tv_amount_overview
     get screenshot

Switch User ID
     AppiumLibrary.wait until element is visible    bt_switch_user
    AppiumLibrary.click element  id=bt_switch_user
    AppiumLibrary.wait until element is visible  alertTitle
    AppiumLibrary.click element    button1
















