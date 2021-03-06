*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource       ../Shared_Keywords.robot
Resource       ../Android_PO/main_menu.robot
Resource       ../Android_PO/transfers.robot

*** Keywords ***


Single Payment
     set appium timeout  30 seconds
    [Arguments]  ${account1}  ${amount}  ${date_from}
    main_menu.Go To Single payment
    Select Account For Someone_else Bottom Slider   ${account1}
    AppiumLibrary.input text   xpath=//*[contains(@resource-id,'et_amount')]   ${amount}
    run keyword and ignore error  hide keyboard
    Scroll Element Down To View    id=com.sovereign.santander.pre:id/bt_continue
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element       id=com.sovereign.santander.pre:id/bt_continue
    AppiumLibrary.wait until element is visible   tv_account_balance
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element    xpath=//*[contains(@resource-id,'bt_continue')]
    AppiumLibrary.wait until element is visible    tv_transaction_completed
    get screenshot
#    AppiumLibrary.capture page screenshot
#    Scroll Element Down To View    id=bt_sms

Send email vi Sansung
    AppiumLibrary.click element      id=bt_email
    AppiumLibrary.wait until element is visible   recipients_editor_to
    AppiumLibrary.click element    xpath=//*[contains(@text,'Gmail')]
    swipe element down
    AppiumLibrary.wait until element is visible    id=com.google.android.gm:id/subject
    AppiumLibrary.input text   id=com.google.android.gm:id/to    jerome.benjamin@external.produban.us
    capture page screenshot
    AppiumLibrary.click element   id=com.google.android.gm:id/send
    AppiumLibrary.wait until element is visible    xpath=//*[contains(@text,'Send by SMS')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Send by SMS')]
    AppiumLibrary.wait until element is visible    id=com.android.mms:id/send_button
    AppiumLibrary.input text   id=com.android.mms:id/recipients_editor_to   8575442929
    AppiumLibrary.click element     id=com.android.mms:id/send_button
    AppiumLibrary.wait until element is visible    xpath=//*[contains(@text,'No signal found for mobile networks.')]
    AppiumLibrary.click element   id=android:id/button1
    AppiumLibrary.wait until element is visible    xpath=//*[contains(@text,'Ignore')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Ignore')]
    AppiumLibrary.wait until element is visible  id=com.android.mms:id/body_text_view
    AppiumLibrary.capture page screenshot
    remove application  com.android.mms


Single Payment Cancel
      set appium timeout  30 seconds
    [Arguments]  ${account1}  ${amount}  ${date_from}
    main_menu.Go To Single payment
    Select Account For Someone_else Bottom Slider   ${account1}
    AppiumLibrary.input text   xpath=//*[contains(@resource-id,'et_amount')]   ${amount}
    run keyword and ignore error  hide keyboard
    Scroll Element Down To View    id=com.sovereign.santander.pre:id/bt_continue
    AppiumLibrary.capture page screenshot
    #AppiumLibrary.click element   et_pay_date
    #set future calendar date  ${date_from}
    #Set Transfers Older device Calendar Date  ${date_from}
    AppiumLibrary.click element       id=com.sovereign.santander.pre:id/bt_continue
    AppiumLibrary.wait until element is visible   tv_account_balance
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element    xpath=//*[contains(@resource-id,'bt_continue')]
    AppiumLibrary.wait until element is visible    tv_transaction_completed
#    AppiumLibrary.capture page screenshot
    go to outgoing payments
    Scroll Element Down To View    xpath=//*[contains(@text,'${amount}')]
    get screenshot
    AppiumLibrary.click element    xpath=//*[contains(@text,'${amount}')]
    AppiumLibrary.wait until element is visible    //android.widget.Button[contains(@text,'Cancel payment')]
    get screenshot
    AppiumLibrary.click element    //android.widget.Button[contains(@text,'Cancel payment')]
    AppiumLibrary.wait until element is visible   button1
    get screenshot
    AppiumLibrary.click element   button1

















