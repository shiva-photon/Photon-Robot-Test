*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource      ../common.robot
Resource      ../IOS_PO/ios_main_menu.robot
*** Keywords ***


Single Payment
     set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    [Arguments]   ${user}  ${amount}
    ios_main_menu.go to single payment
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
    scroll down to view  com.santander.us.mob.pre:id/iv_sms
    click element  xpath=//*[contains(@text,'Send by Email')]
    wait until element is visible  xpath=//*[contains(@text,'Gmail')]
    click element   xpath=//*[contains(@text,'Gmail')]
    swipe element down
    wait until element is visible  id=com.google.android.gm:id/subject
    input text   id=com.google.android.gm:id/to    jerome.benjamin@external.produban.us
    capture page screenshot
    click element  id=com.google.android.gm:id/send
    wait until element is visible  xpath=//*[contains(@text,'Send by SMS')]
    click element  xpath=//*[contains(@text,'Send by SMS')]
    wait until element is visible  id=com.android.mms:id/send_button
    input text   id=com.android.mms:id/recipients_editor_to   8575442929
    click element    id=com.android.mms:id/send_button
    wait until element is visible  xpath=//*[contains(@text,'No signal found for mobile networks.')]
    click element  id=android:id/button1
    wait until element is visible  xpath=//*[contains(@text,'Ignore')]
    click element  xpath=//*[contains(@text,'Ignore')]
    wait until element is visible   id=com.android.mms:id/body_text_view
    capture page screenshot
    remove application  com.android.mms



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













