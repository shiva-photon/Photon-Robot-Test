*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource       ../common.robot
Resource      ../IOS_PO/ios_main_menu.robot
Resource      ../IOS_PO/ios_overview.robot

*** Keywords ***
Validate I Want To Options
    AppiumLibrary.wait until element is visible  name=i_want_to_btn
    AppiumLibrary.click element      name=i_want_to_btn
    AppiumLibrary.wait until element is visible  name=account_details_btn
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  name=transfer_funds_btn
    AppiumLibrary.wait until element is visible  name=Between My Accounts
    AppiumLibrary.capture page screenshot
    AppiumLibrary.page should contain element    name=To Someone else
    AppiumLibrary.page should contain element    name=deposit_checks_btn
    AppiumLibrary.click element                  name=pay_bill_btn
    AppiumLibrary.wait until element is visible  name=single_payment_btn
    AppiumLibrary.page should contain element    name=unpaid_ebills_btn
    AppiumLibrary.page should contain element    name=outgoing_payment_btn
    AppiumLibrary.page should contain element    name=account_details_btn
    AppiumLibrary.capture page screenshot

Account Details
    #set appium timeout  30 seconds
    [Arguments]  ${account}
    [Tags]  My_Money_Account_Details
    AppiumLibrary.wait until element is visible   name=My Money
    log  My money botton is visible
    AppiumLibrary.click element   ${account}
    ios_account_details.Validate I Want To Options
    AppiumLibrary.click element    account_details_btn
    AppiumLibrary.wait until element is visible   view_act_btn
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  view_act_btn
    AppiumLibrary.page should contain element   Current Balance
    AppiumLibrary.page should contain element   Today's Deposits
    AppiumLibrary.page should contain element   Today's Withdrawals
    AppiumLibrary.capture page screenshot

Filtering_Option_All
    set appium timeout  30 seconds
    [Arguments]  ${account}  ${TransFromDate}   ${TransToDate}
    [Tags]  My_Money_Account_Details
    Validate I Want To Options
    AppiumLibrary.wait until element is visible  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.click element  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'${TransToDate}')]
    AppiumLibrary.page should contain element   id=bt_email
    AppiumLibrary.page should contain element   id=iv_sms
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   id=iv_sms
#    AppiumLibrary.wait until element is visible  id=recipients_editor_to
#    input text  recipients_editor_to   8575442929
#    AppiumLibrary.click element   id=send_button

Filtering_Option_IN
    set appium timeout  30 seconds
    [Arguments]  ${account}  ${TransFromDate}   ${TransToDate}
    [Tags]  My_Money_Account_Details
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    Scroll Up To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//android.widget.ImageView[@index='0']
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Between My Accounts')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'To Someone Else')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Deposit Checks')]
    AppiumLibrary.click element  xpath=//*[contains(@text,'Pay a Bill')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Unpaid e-Bills')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Outgoing Payments')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  xpath=//*[contains(@text,'I WANT TO …')]
    wait until page does not contain element  xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.capture page screenshot

    AppiumLibrary.wait until element is visible  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.click element  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'${TransToDate}')]
    AppiumLibrary.page should contain element   id=bt_email
    AppiumLibrary.page should contain element   id=iv_sms
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   id=iv_sms
    sleep  3s
    AppiumLibrary.capture page screenshot
#    AppiumLibrary.wait until element is visible  id=recipients_editor_to
#    input text  recipients_editor_to   8575442929
#    AppiumLibrary.click element   id=send_button
Filtering_Option_OUT
    set appium timeout  30 seconds
    [Arguments]  ${account}  ${TransFromDate}   ${TransToDate}
    [Tags]  My_Money_Account_Details
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    Scroll Up To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//android.widget.ImageView[@index='0']
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Between My Accounts')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'To Someone Else')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Deposit Checks')]
    AppiumLibrary.click element  xpath=//*[contains(@text,'Pay a Bill')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Unpaid e-Bills')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Outgoing Payments')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  xpath=//*[contains(@text,'I WANT TO …')]
    wait until page does not contain element  xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.capture page screenshot

#    AppiumLibrary.wait until element is visible  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
#    AppiumLibrary.click element  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
#    #AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'${TransToDate}')]
#    AppiumLibrary.page should contain element   id=bt_email
#    AppiumLibrary.page should contain element   id=iv_sms
#    AppiumLibrary.capture page screenshot
#    AppiumLibrary.click element   id=iv_sms
#    sleep  3s
#    AppiumLibrary.capture page screenshot
#    ${SMS} =  get current context
#    switch to context  ${SMS}
#    AppiumLibrary.wait until element is visible   id=recipients_editor_to
#    input text  recipients_editor_to   8575442929
#    AppiumLibrary.click element   id=send_button

I_Want_To_options

    [Arguments]  ${account}
    [Tags]  My_Money_Account_Details
    set appium timeout  30 seconds
    AppiumLibrary.wait until element is visible      name=My Money
    log  My money botton is visible
    common.Scroll Up To View   name=${account}
    AppiumLibrary.click element       name=${account}
    AppiumLibrary.wait until element is visible   i_want_to_btn
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element      i_want_to_btn
    AppiumLibrary.wait until element is visible  name=account_details_btn
    #validate Tranfer Funds options
    AppiumLibrary.click element      transfer_funds_btn
    AppiumLibrary.wait until element is visible   Between My Accounts
    AppiumLibrary.page should contain element   name=To Someone else
    #validate Between My Accounts Page
    AppiumLibrary.click element    Between My Accounts
    AppiumLibrary.wait until element is visible     TO ACCOUNT
    AppiumLibrary.capture page screenshot
    Return To Menu
    AppiumLibrary.click element      transfer_funds_btn
    AppiumLibrary.wait until element is visible   Between My Accounts
    #validate To Someone else Page
    AppiumLibrary.click element  name=To Someone else
    AppiumLibrary.wait until element is visible   from_account_carousell
    AppiumLibrary.page should contain element   from_account_carousell
    AppiumLibrary.page should contain element   to_account_carousell
    AppiumLibrary.page should contain element    amount_field
    AppiumLibrary.capture page screenshot
    Return To Menu
    #validate deposit_checks_btn Page
    AppiumLibrary.click element       name=deposit_checks_btn
    AppiumLibrary.wait until element is visible   DEPOSIT TO
    AppiumLibrary.page should contain element   accounts_carousell
    AppiumLibrary.page should contain element   deposit_amount
    common.scroll down to view    continue_btn
    AppiumLibrary.page should contain element  email_field
    AppiumLibrary.capture page screenshot
    Return To Menu
    AppiumLibrary.click element   pay_bill_btn
    AppiumLibrary.wait until element is visible   Single Payment
    AppiumLibrary.click element   Single Payment
    AppiumLibrary.wait until element is visible    from_account_carousell
    AppiumLibrary.page should contain element    to_account_carousell
    AppiumLibrary.page should contain element   amount_field
    AppiumLibrary.capture page screenshot
    Return To Menu
    AppiumLibrary.click element   pay_bill_btn
    AppiumLibrary.wait until element is visible   Unpaid e-Bills
    AppiumLibrary.click element  Unpaid e-Bills
    AppiumLibrary.wait until element is visible   You have no unpaid e-Bills. Please click on the menu icon in the top right to view your accounts or access another app feature.
    #AppiumLibrary.page should contain element     transaction_amount
    #AppiumLibrary.page should contain element     receiver
    AppiumLibrary.capture page screenshot
    Return To Menu
    AppiumLibrary.click element   pay_bill_btn
    AppiumLibrary.wait until element is visible   Unpaid e-Bills
    AppiumLibrary.click element    Outgoing Payments
    AppiumLibrary.wait until element is visible   You have no scheduled payments. Please click on the menu icon in the top right to view your accounts or access another app feature.
    AppiumLibrary.capture page screenshot
    Return To Menu
    AppiumLibrary.click element    account_details_btn
    AppiumLibrary.wait until element is visible   view_act_btn
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  view_act_btn
    AppiumLibrary.page should contain element   Current Balance
    AppiumLibrary.page should contain element   Today's Deposits
    AppiumLibrary.page should contain element   Today's Withdrawals
    AppiumLibrary.capture page screenshot
Filter All
    AppiumLibrary.click element   id=bt_filter
    AppiumLibrary.wait until element is visible  id=bt_all
    element attribute should match   id=bt_all   selected   True
    Log  All Button is selected
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element    id=bt_filter

Filter In
    [Arguments]  ${TransFromDate}    ${TransToDate}
     AppiumLibrary.click element   id=bt_filter
    AppiumLibrary.wait until element is visible  id=bt_all
    element attribute should match   id=bt_all   selected   True
    Log  All Button is selected
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   id=bt_in
    element attribute should match   id=bt_in   selected   True
    AppiumLibrary.click element  id=et_from
    Set Calendar Date   13 March 2017
    Set Calendar Date   14 March 2017
    element should contain text  id=et_from    ${TransFromDate}
    element should contain text  id=et_to      ${TransToDate}
    AppiumLibrary.click element    id=bt_filter
Filter Out
    [Arguments]  ${TransFromDate}    ${TransToDate}
     AppiumLibrary.click element   id=bt_filter
    AppiumLibrary.wait until element is visible  id=bt_all
    element attribute should match   id=bt_all   selected   True
    Log  All Button is selected
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   id=bt_out
    element attribute should match   id=bt_out   selected   True
    AppiumLibrary.click element  id=et_from
    Set Calendar Date   13 March 2017
    Set Calendar Date   14 March 2017
    element should contain text  id=et_from    ${TransFromDate}
    element should contain text  id=et_to      ${TransToDate}
    AppiumLibrary.click element    id=bt_filter

Return To Menu
    AppiumLibrary.click element    back_btn
    AppiumLibrary.wait until element is visible  i_want_to_btn
    AppiumLibrary.click element      i_want_to_btn
    AppiumLibrary.wait until element is visible  name=account_details_btn



