*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource       ../common.robot

*** Keywords ***


Checking Account
     set appium timeout  10 seconds
    [Tags]  My_Money_Account_Details
    [Arguments]  ${amount}
    wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    click element  id=action_menu
    wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    capture page screenshot
    click element  xpath=//*[contains(@text,'Settings')]
    wait until element is visible  xpath=//*[contains(@text,'Quick Balance')]
    capture page screenshot
    click element   xpath=//*[contains(@text,'Quick Balance')]
    wait until element is visible  xpath=//*[contains(@text,'Select up to three accounts')]
    capture page screenshot
    ${t}  get text   xpath=//android.widget.RelativeLayout[2]
    log to console  ${t}
    click element  xpath=//android.widget.RelativeLayout[1]//android.widget.CheckBox[1]
    click element  id=/bt_continue
    wait until element is visible  xpath=//*[contains(@text,'Congratulations! You're all set to use Quick Balance')]
    capture page screenshot
    click element  id=/bt_continue
    wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    capture page screenshot
    log out app

log in quick settings
    wait until element is visible  id=com.santander.us.mob.pre:id/iv_quick_balance
    click element  id=com.santander.us.mob.pre:id/iv_quick_balance
    wait until element is visible  xpath=//*[contains(@text,'SAVINGS')]
    capture page screenshot





Single Payment Cancel

     set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    [Arguments]  ${amount}
    wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    click element  id=action_menu
    wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    capture page screenshot
    click element  xpath=//*[contains(@text,'BillPay')]
    wait until element is visible  xpath=//*[contains(@text,'Single payment')]
    capture page screenshot
    click element   xpath=//*[contains(@text,'Single payment')]
    wait until element is visible  id=com.santander.us.mob.pre:id/et_amount
    capture page screenshot
    input text   id=com.santander.us.mob.pre:id/et_amount   ${amount}
    hide keyboard
    scroll down to view  id=com.santander.us.mob.pre:id/bt_continue
    capture page screenshot
    click element  id=com.santander.us.mob.pre:id/bt_continue
    wait until element is visible  xpath=//*[contains(@text,'Memo')]
    capture page screenshot
    click element   com.santander.us.mob.pre:id/bt_continue
    wait until element is visible  xpath=//*[contains(@text,'successfully')]
    capture page screenshot
    click element   id=com.santander.us.mob.pre:id/bt_continue
    wait until element is visible  id=com.santander.us.mob.pre:id/et_amount
     capture page screenshot
    click element  id=com.santander.us.mob.pre:id/action_menu
    wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    capture page screenshot
    click element  xpath=//*[contains(@text,'Outgoing payments')]
    wait until element is visible  id=com.santander.us.mob.pre:id/tv_date
    capture page screenshot
    scroll down to view    xpath=//*[contains(@text,'${amount}')]
    capture page screenshot
    click element   xpath=//*[contains(@text,'${amount}')]
    wait until element is visible  xpath=//*[contains(@text,'Cancel payment')]
    capture page screenshot
    click element  xpath=//*[contains(@text,'Cancel payment')]
    wait until element is visible  xpath=//*[contains(@text,'Are you sure you want to cancel this payment?')]
     capture page screenshot
    click element  xpath=//*[contains(@text,'Yes')]
    wait until element is visible  xpath=//*[contains(@text,'Payment canceled')]
    capture page screenshot
    click element  xpath=//*[contains(@text,'OK')]
    wait until element is visible  id=com.santander.us.mob.pre:id/rv_outgoing_payments
    capture page screenshot













