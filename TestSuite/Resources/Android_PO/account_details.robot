*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource       ../Shared_Keywords.robot
Resource       ../Android_PO/main_menu.robot


*** Keywords ***

My_Money_Account_Details
    set appium timeout  30 seconds
    [Arguments]  ${account}
    Page Should Contain Text       My Money
    log  My money botton is visible
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//android.widget.ImageView[@index='0']
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Between My Accounts')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'To Someone Else')]
    #AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Deposit Checks')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Pay a Bill')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Unpaid e-Bills')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Outgoing Payments')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.Wait Until Page Does Not Contain Element    xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.wait until element is visible  id=container_button_filter
    AppiumLibrary.page should contain element  id=iv_transaction_type
    Return To Overview
Credit Cards My_Money_Account_Details
    set appium timeout  30 seconds
    [Arguments]  ${account}
    Page Should Contain Text       My Money
    log  My money botton is visible
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//android.widget.ImageView[@index='0']
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Between My Accounts')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'To Someone Else')]
    #AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Deposit Checks')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Pay a Bill')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Unpaid e-Bills')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Outgoing Payments')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.Wait Until Page Does Not Contain Element    xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.wait until element is visible  id=container_button_filter
   AppiumLibrary.page should contain element  id=iv_transaction_type

   Return To Overview
Tablet Account Details
    set appium timeout  30 seconds
    [Arguments]  ${account}
    [Tags]  My_Money_Account_Details
    Page Should Contain Text       My Money
    log  My money botton is visible
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'FULL ACCOUNT NUMBER')]
    get screenshot
    AppiumLibrary.click element      xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'BETWEEN MY ACCOUNTS')]
    get screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'TO SOMEONE ELSE')]
    ###AppiumLibrary.page should contain element    xpath=//*[contains(@text,'CHECK DEPOSIT')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'BILLPAY')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'SINGLE PAYMENT')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'UNPAID E-BILLS')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'OUTGOING PAYMENTS')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    get screenshot
    AppiumLibrary.page should contain element    id=bt_filter
    log   transaction filter is visible
   #match date in format Monday, March 13, 2017
   #AppiumLibrary.page should contain element  xpath=//android.widget.ImageView[@resource-id='iv_transaction_type']
   AppiumLibrary.page should contain element     xpath=//android.widget.TextView[contains(@text,'$')][1]
   log   transaction amount is visible
   AppiumLibrary.page should contain element     id=iv_transaction_type
   log   transaction type is visible
    AppiumLibrary.page should contain element      id=tv_amount
    AppiumLibrary.page should contain element     id=tv_detail
   get screenshot
#   scroll down to view  xpath=//android.widget.ImageView[@resource-id='iv_transaction_type'][0]
Tablet Credit Details
    set appium timeout  30 seconds
    [Arguments]  ${account}
    [Tags]  My_Money_Account_Details
    Page Should Contain Text       My Money
    log  My money botton is visible
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'ACTIVITY')]
    get screenshot
    AppiumLibrary.page should contain text    PREVIOUS STATEMENTS
    AppiumLibrary.page should contain text    SINGLE PAYMENTS
    AppiumLibrary.page should contain text    AUTOPAY
    AppiumLibrary.click element   xpath=//*[contains(@text,'CARD DETAILS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'FULL ACCOUNT NUMBER')]
    get screenshot
    AppiumLibrary.click element      xpath=//*[contains(@content-desc,'Navigate up')]
    go back
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'ACTIVITY')]
    get screenshot
    AppiumLibrary.page should contain element    id=bt_filter
    log   transaction filter is visible

Tablet Filtering Option All
    set appium timeout  30 seconds
    [Arguments]  ${account}  ${TransFromDate}   ${TransToDate}
    AppiumLibrary.Page Should Contain Text       My Money
    log  My money botton is visible
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'FULL ACCOUNT NUMBER')]
    get screenshot
    AppiumLibrary.click element      xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'BETWEEN MY ACCOUNTS')]
    get screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'TO SOMEONE ELSE')]
    ##AppiumLibrary.page should contain element    xpath=//*[contains(@text,'CHECK DEPOSIT')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'BILLPAY')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'SINGLE PAYMENT')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'UNPAID E-BILLS')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'OUTGOING PAYMENTS')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    get screenshot
    AppiumLibrary.page should contain element    id=bt_filter
    log   transaction filter is visible
    AppiumLibrary.click element    id=bt_filter
    AppiumLibrary.wait until element is visible  id=bt_all
    AppiumLibrary.element attribute should match   id=bt_all   selected   True
    Log  All Button is selected
    get screenshot
    AppiumLibrary.click element    id=et_from
    #date format should be  13 March 2017
    Shared_Keywords.Set Tablet Past Calendar Date   ${TransFromDate}
    Shared_Keywords.Set Tablet Past Calendar Date   ${TransToDate}
    sleep  2s
    #validation date format should be
    ${us_format_from}   Convert Date To DMY Format    ${TransFromDate}
    ${us_format_to}   Convert Date To DMY Format     ${TransToDate}
    AppiumLibrary.element should contain text   id=et_from    ${us_format_from}
    AppiumLibrary.element should contain text   id=et_to      ${us_format_to}
    AppiumLibrary.click element     id=bt_filter
    AppiumLibrary.wait until element is visible  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.click element   xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.page should contain element   id=bt_email
    AppiumLibrary.page should contain element   id=iv_sms
    get screenshot
    AppiumLibrary.click element    id=bt_email
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Gmail')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'Gmail')]
    AppiumLibrary.wait until element is visible   id=com.google.android.gm:id/subject
    get screenshot
    AppiumLibrary.input text     id=com.google.android.gm:id/to     jerome.benjamin@external.produban.us
    get screenshot
    AppiumLibrary.click element     id=com.google.android.gm:id/send
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    get screenshot

Filtering_Option_All
    [Arguments]  ${account}  ${TransFromDate}   ${TransToDate}
    set appium timeout  30 seconds
    AppiumLibrary.Page Should Contain Text       My Money
    log  My money botton is visible
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//android.widget.ImageView[@index='0']
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Between My Accounts')]
    get screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'To Someone Else')]
    #AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Deposit Checks')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Pay a Bill')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Unpaid e-Bills')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Outgoing Payments')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.Wait Until Page Does Not Contain Element  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element    id=bt_filter
    AppiumLibrary.wait until element is visible  id=bt_all
    AppiumLibrary.element attribute should match   id=bt_all   selected   True
    Log  All Button is selected
    get screenshot
    AppiumLibrary.click element     id=bt_filter
    AppiumLibrary.wait until element is visible  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.click element   xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.wait until element is visible   id=bt_email
    AppiumLibrary.page should contain element   id=bt_email
    AppiumLibrary.page should contain element   id=iv_sms
    get screenshot
#    AppiumLibrary.click element    id=iv_sms
#    AppiumLibrary.wait until element is visible  id=com.android.mms:id/recipients_editor_to
#    AppiumLibrary.input text   id=com.android.mms:id/recipients_editor_to       8575442929
#    AppiumLibrary.click element    id=com.android.mms:id/send_button
#    get screenshot
Credit Cards Filtering_Option_All
    [Arguments]  ${account}  ${TransFromDate}   ${TransToDate}
    set appium timeout  30 seconds
    AppiumLibrary.Page Should Contain Text       My Money
    log  My money botton is visible
    select credit card account  ${account}
    get screenshot
    AppiumLibrary.click element    id=bt_filter
    AppiumLibrary.wait until element is visible  id=bt_all
    AppiumLibrary.element attribute should match   id=bt_all   selected   True
    Log  All Button is selected
    get screenshot
    AppiumLibrary.click element     id=bt_filter
    AppiumLibrary.wait until element is visible  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.click element   xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.wait until element is visible   id=bt_email
    AppiumLibrary.page should contain element   id=bt_email
    AppiumLibrary.page should contain element   id=iv_sms
    get screenshot
#    AppiumLibrary.click element    id=iv_sms
#    AppiumLibrary.wait until element is visible  id=com.android.mms:id/recipients_editor_to
#    AppiumLibrary.input text   id=com.android.mms:id/recipients_editor_to       8575442929
#    AppiumLibrary.click element    id=com.android.mms:id/send_button
#    get screenshot

Filtering_Option_IN
    [Arguments]  ${account}  ${TransFromDate}   ${TransToDate}
    AppiumLibrary.Page Should Contain Text       My Money
    log  My money botton is visible
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'I WANT TO …')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Between My Accounts')]
    get screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'To Someone Else')]
    #AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Deposit Checks')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Pay a Bill')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Unpaid e-Bills')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Outgoing Payments')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.Wait Until Page Does Not Contain Element  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element    id=bt_filter
    AppiumLibrary.wait until element is visible  id=bt_all
    AppiumLibrary.element attribute should match   id=bt_all   selected   True
    Log  All Button is selected
    get screenshot
    AppiumLibrary.click element    id=bt_in
    AppiumLibrary.element attribute should match   id=bt_in   selected   True
    AppiumLibrary.click element    id=et_from
    Shared_Keywords.Set Calendar Date    ${TransFromDate}
    Shared_Keywords.Set Calendar Date    ${TransToDate}
    ${ValidateFDate}     convert date to dmy format     ${TransFromDate}
    ${ValidatetDate}     convert date to dmy format     ${TransToDate}
    AppiumLibrary.element should contain text  id=et_from     ${ValidateFDate}
    AppiumLibrary.element should contain text  id=et_to       ${ValidateTDate}
    AppiumLibrary.click element     id=bt_filter
    AppiumLibrary.wait until element is visible  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.click element   xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.wait until element is visible   id=bt_email
    AppiumLibrary.page should contain element   id=bt_email
    AppiumLibrary.page should contain element   id=iv_sms
    get screenshot
#    AppiumLibrary.click element    id=iv_sms
#    AppiumLibrary.wait until element is visible  id=com.android.mms:id/recipients_editor_to
#    AppiumLibrary.input text   id=com.android.mms:id/recipients_editor_to       8575442929
#    AppiumLibrary.click element    id=com.android.mms:id/send_button
#    get screenshot
Credit Cards Filtering_Option_IN
    set appium timeout  30 seconds
    [Arguments]  ${account}  ${TransFromDate}   ${TransToDate}
    AppiumLibrary.Page Should Contain Text       My Money
    log  My money botton is visible
    select credit card account  ${account}
    AppiumLibrary.click element    id=bt_filter
    AppiumLibrary.wait until element is visible  id=bt_all
    AppiumLibrary.element attribute should match   id=bt_all   selected   True
    Log  All Button is selected
    get screenshot
    AppiumLibrary.click element    id=bt_in
    AppiumLibrary.element attribute should match   id=bt_in   selected   True
    AppiumLibrary.click element     id=bt_filter
    AppiumLibrary.wait until element is visible  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.click element   xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.wait until element is visible   id=bt_email
    AppiumLibrary.page should contain element   id=bt_email
    AppiumLibrary.page should contain element   id=iv_sms
    get screenshot
#    AppiumLibrary.click element    id=iv_sms
#    AppiumLibrary.wait until element is visible  id=com.android.mms:id/recipients_editor_to
#    AppiumLibrary.input text   id=com.android.mms:id/recipients_editor_to       8575442929
#    AppiumLibrary.click element    id=com.android.mms:id/send_button
#    get screenshot
Tablet Filtering_Option_IN
    set appium timeout  30 seconds
    [Arguments]  ${account}  ${TransFromDate}   ${TransToDate}
    AppiumLibrary.Page Should Contain Text       My Money
    log  My money botton is visible
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'FULL ACCOUNT NUMBER')]
    get screenshot
    AppiumLibrary.click element      xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'BETWEEN MY ACCOUNTS')]
    get screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'TO SOMEONE ELSE')]
    ###AppiumLibrary.page should contain element    xpath=//*[contains(@text,'CHECK DEPOSIT')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'BILLPAY')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'SINGLE PAYMENT')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'UNPAID E-BILLS')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'OUTGOING PAYMENTS')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    get screenshot
    AppiumLibrary.page should contain element    id=bt_filter
    log   transaction filter is visible
    AppiumLibrary.click element    id=bt_filter
    AppiumLibrary.wait until element is visible  id=bt_all
    AppiumLibrary.element attribute should match   id=bt_all   selected   True
    Log  All Button is selected
    get screenshot
    AppiumLibrary.click element    id=bt_in
    AppiumLibrary.element attribute should match   id=bt_in   selected   True
    AppiumLibrary.click element   id=et_from
    Shared_Keywords.Set Tablet Past Calendar Date   ${TransFromDate}
    Shared_Keywords.Set Tablet Past Calendar Date   ${TransToDate}
    ${us_format_from}   Convert Date To DMY Format    ${TransFromDate}
    ${us_format_to}   Convert Date To DMY Format     ${TransToDate}
    AppiumLibrary.element should contain text   id=et_from    ${us_format_from}
    AppiumLibrary.element should contain text   id=et_to      ${us_format_to}
    AppiumLibrary.click element     id=bt_filter
    AppiumLibrary.wait until element is visible  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.click element   xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.page should contain element   id=bt_email
    AppiumLibrary.page should contain element   id=iv_sms
    get screenshot
#    AppiumLibrary.click element    id=bt_email
#    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Gmail')]
#    AppiumLibrary.click element    xpath=//*[contains(@text,'Gmail')]
#    AppiumLibrary.wait until element is visible   id=com.google.android.gm:id/subject
#    get screenshot
#    AppiumLibrary.input text     id=com.google.android.gm:id/to     jerome.benjamin@external.produban.us
#    get screenshot
#    AppiumLibrary.click element     id=com.google.android.gm:id/send
#    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'ACCOUNT DETAILS')]
#    get screenshot
Filtering_Option_OUT
    [Arguments]  ${account}  ${TransFromDate}   ${TransToDate}
    set appium timeout  30 seconds
    AppiumLibrary.Page Should Contain Text       My Money
    log  My money botton is visible
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'I WANT TO …')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Between My Accounts')]
    get screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'To Someone Else')]
    #AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Deposit Checks')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Pay a Bill')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Unpaid e-Bills')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Outgoing Payments')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.Wait Until Page Does Not Contain Element  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element    id=bt_filter
    AppiumLibrary.wait until element is visible  id=bt_all
    element attribute should match   id=bt_all   selected   True
    Log  All Button is selected
    get screenshot
    AppiumLibrary.click element    id=bt_out
    element attribute should match   id=bt_out   selected   True
    AppiumLibrary.click element    id=et_from
    Shared_Keywords.Set Calendar Date    ${TransFromDate}
    Shared_Keywords.Set Calendar Date    ${TransToDate}
    ${ValidateFDate}     convert date to dmy format     ${TransFromDate}
    ${ValidatetDate}     convert date to dmy format     ${TransToDate}
    get screenshot
    AppiumLibrary.element should contain text  id=et_from     ${ValidateFDate}
    AppiumLibrary.element should contain text  id=et_to       ${ValidateTDate}

    AppiumLibrary.click element     id=bt_filter
    AppiumLibrary.wait until element is visible  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.click element   xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.wait until element is visible   id=bt_email
    AppiumLibrary.page should contain element   id=bt_email
    AppiumLibrary.page should contain element   id=iv_sms
    get screenshot
#    AppiumLibrary.click element    id=iv_sms
#    AppiumLibrary.wait until element is visible  id=com.android.mms:id/recipients_editor_to
#    AppiumLibrary.input text   id=com.android.mms:id/recipients_editor_to       8575442929
#    AppiumLibrary.click element    id=com.android.mms:id/send_button
#    get screenshot
Credit Cards Filtering_Option_OUT
    set appium timeout  30 seconds
    [Arguments]  ${account}  ${TransFromDate}   ${TransToDate}
    set appium timeout  30 seconds
    AppiumLibrary.Page Should Contain Text       My Money
    log  My money botton is visible
    select credit card account  ${account}
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'I WANT TO …')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Between My Accounts')]
    get screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'To Someone Else')]
    #AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Deposit Checks')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Pay a Bill')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Unpaid e-Bills')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Outgoing Payments')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.Wait Until Page Does Not Contain Element  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element    id=bt_filter
    AppiumLibrary.wait until element is visible  id=bt_all
    element attribute should match   id=bt_all   selected   True
    Log  All Button is selected
    get screenshot
    AppiumLibrary.click element    id=bt_out
    AppiumLibrary.element attribute should match   id=bt_out   selected   True
    AppiumLibrary.click element     id=bt_filter
    AppiumLibrary.wait until element is visible  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.click element   xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.wait until element is visible   id=bt_email
    AppiumLibrary.page should contain element   id=bt_email
    AppiumLibrary.page should contain element   id=iv_sms
    get screenshot
#    AppiumLibrary.click element    id=iv_sms
#    AppiumLibrary.wait until element is visible  id=com.android.mms:id/recipients_editor_to
#    AppiumLibrary.input text   id=com.android.mms:id/recipients_editor_to       8575442929
#    AppiumLibrary.click element    id=com.android.mms:id/send_button
#    get screenshot
Tablet Filtering_Option_OUT
     set appium timeout  30 seconds
    [Arguments]  ${account}  ${TransFromDate}   ${TransToDate}
    AppiumLibrary.Page Should Contain Text       My Money
    log  My money botton is visible
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'FULL ACCOUNT NUMBER')]
    get screenshot
    AppiumLibrary.click element      xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'BETWEEN MY ACCOUNTS')]
    get screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'TO SOMEONE ELSE')]
    ##AppiumLibrary.page should contain element    xpath=//*[contains(@text,'CHECK DEPOSIT')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'BILLPAY')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'SINGLE PAYMENT')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'UNPAID E-BILLS')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'OUTGOING PAYMENTS')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    get screenshot
    AppiumLibrary.page should contain element    id=bt_filter
    log   transaction filter is visible
    AppiumLibrary.click element    id=bt_filter
    AppiumLibrary.wait until element is visible  id=bt_all
    AppiumLibrary.element attribute should match   id=bt_all   selected   True
    Log  All Button is selected
    get screenshot
    AppiumLibrary.click element    id=bt_out
    AppiumLibrary.element attribute should match   id=bt_out   selected   True
    AppiumLibrary.click element   id=et_from
    Shared_Keywords.Set Tablet Past Calendar Date     ${TransFromDate}
    Shared_Keywords.Set Tablet Past Calendar Date    ${TransToDate}
    ${us_format_from}   Convert Date To DMY Format    ${TransFromDate}
    ${us_format_to}   Convert Date To DMY Format     ${TransToDate}
    AppiumLibrary.element should contain text   id=et_from    ${us_format_from}
    AppiumLibrary.element should contain text   id=et_to      ${us_format_to}
    AppiumLibrary.click element     id=bt_filter
    AppiumLibrary.wait until element is visible  xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    AppiumLibrary.click element   xpath=//android.support.v7.widget.RecyclerView[1]//android.widget.RelativeLayout[@index='0']
    #AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'${TransToDate}')]
    AppiumLibrary.page should contain element   id=bt_email
    AppiumLibrary.page should contain element   id=iv_sms
    get screenshot
#    AppiumLibrary.click element    id=bt_email
#    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Gmail')]
#    AppiumLibrary.click element    xpath=//*[contains(@text,'Gmail')]
#    AppiumLibrary.wait until element is visible   id=com.google.android.gm:id/subject
#    get screenshot
#    AppiumLibrary.input text     id=com.google.android.gm:id/to     jerome.benjamin@external.produban.us
#    get screenshot
#    AppiumLibrary.click element     id=com.google.android.gm:id/send
#    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'ACCOUNT DETAILS')]
#    get screenshot

I_Want_To_options
    set appium timeout  30 seconds
    [Arguments]  ${account}
    AppiumLibrary.Page Should Contain Text       My Money
    log  My money botton is visible
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'I WANT TO …')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Between My Accounts')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Between My Accounts')]
    AppiumLibrary.wait until element is visible  xpath=//android.support.v4.view.ViewPager[1]//*[contains(@resource-id,'tv_available_balance')]
    get screenshot
    AppiumLibrary.click element    xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'To Someone Else')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'To Someone Else')]
    AppiumLibrary.wait until element is visible  xpath=//android.support.v4.view.ViewPager[1]//*[contains(@resource-id,'tv_available_balance')]
    get screenshot
    AppiumLibrary.click element    xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    #AppiumLibrary.click element   xpath=//*[contains(@text,'Deposit Checks')]
    #AppiumLibrary.wait until page contains    Terms and Conditions
    #AppiumLibrary.click element    xpath=//*[contains(@content-desc,'Navigate up')]

    AppiumLibrary.click element   xpath=//*[contains(@text,'Pay a Bill')]
    AppiumLibrary.wait until element is visible    xpath=//*[contains(@text,'Single Payment')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.wait until element is visible    et_amount
    get screenshot
    AppiumLibrary.click element    xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
     AppiumLibrary.click element   xpath=//*[contains(@text,'Pay a Bill')]
     AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Single Payment')]
     get screenshot
     AppiumLibrary.click element   xpath=//*[contains(@text,'Unpaid e-Bills')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'BillPay')]
    get screenshot
    AppiumLibrary.click element    xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Pay a Bill')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Outgoing Payments')]
    get screenshot
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'BillPay')]
    get screenshot
    AppiumLibrary.click element    xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'FULL ACCOUNT NUMBER')]
    get screenshot
    AppiumLibrary.click element    xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'I WANT TO …')]
Tablet I Want To options

    set appium timeout  60 seconds
    [Arguments]  ${account}
    [Tags]  My_Money_Account_Details
    AppiumLibrary.Page Should Contain Text       My Money
    log  My money botton is visible
    Scroll Element Down To View   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'FULL ACCOUNT NUMBER')]
    get screenshot
    AppiumLibrary.click element      xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'BETWEEN MY ACCOUNTS')]
    get screenshot
    AppiumLibrary.click element                   xpath=//*[contains(@text,'BETWEEN MY ACCOUNTS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'FROM')]
    get screenshot
    AppiumLibrary.click element      xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'BETWEEN MY ACCOUNTS')]
    get screenshot
    AppiumLibrary.click element                   xpath=//*[contains(@text,'TO SOMEONE ELSE')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'FROM')]
    get screenshot
    AppiumLibrary.click element                    xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER FUNDS')]
    AppiumLibrary.click element                    xpath=//*[contains(@text,'CHECK DEPOSIT')]
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'Terms and Conditions')]
    AppiumLibrary.click element                    xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible                 xpath=//*[contains(@text,'BILLPAY')]
    AppiumLibrary.click element                    xpath=//*[contains(@text,'BILLPAY')]
#    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'SINGLE PAYMENT')]
#    AppiumLibrary.click element                    xpath=//*[contains(@text,'SINGLE PAYMENT')]
 #   AppiumLibrary.wait until element is visible
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'UNPAID E-BILLS')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'OUTGOING PAYMENTS')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'ACCOUNT DETAILS')]
    get screenshot
Contact_Us
    [Documentation]     Validate the text and phone numbers on the contact page
    set appium timeout  30 seconds
    go to contact us
    AppiumLibrary.page should contain text  1-877-768-2265
    AppiumLibrary.page should contain text  7 days per week between the hours of 6 a.m. to 10 p.m. ET
    AppiumLibrary.page should contain text  Support for customers with hearing impairments
    AppiumLibrary.page should contain text  1-800-428-9121 (TTY/TDD)
    AppiumLibrary.page should contain text  7 days per week between the hours of 6 a.m. to 10 p.m. ET
    AppiumLibrary.page should contain text  Support for customers calling from outside the United States
    AppiumLibrary.page should contain text  1-401-824-3400
    AppiumLibrary.page should contain text  7 days per week between the hours of 6 a.m. to 10 p.m. ET
    AppiumLibrary.page should contain text  Lost or stolen debit card
    AppiumLibrary.page should contain text  1-800-762-5895
    get screenshot
Tablet Contact_Us
    set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    Page Should Contain Text       My Money
    log  My money botton is visible
    AppiumLibrary.click element   id=action_menu
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Contact Us')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Customer Support')]
    AppiumLibrary.page should contain text  1-877-768-2265
    AppiumLibrary.page should contain text  7 days per week between the hours of 6 a.m. to 10 p.m. ET
    AppiumLibrary.page should contain text  Support for customers with hearing impairments
    AppiumLibrary.page should contain text  1-800-428-9121 (TTY/TDD)
    AppiumLibrary.page should contain text  7 days per week between the hours of 6 a.m. to 10 p.m. ET
    AppiumLibrary.page should contain text  Support for customers calling from outside the United States
    AppiumLibrary.page should contain text  1-401-824-3400
    AppiumLibrary.page should contain text  7 days per week between the hours of 6 a.m. to 10 p.m. ET
    AppiumLibrary.page should contain text  Lost or stolen debit card
    AppiumLibrary.page should contain text  1-800-762-5895
    get screenshot

Go_Paperless_All_Account
    set appium timeout  30 seconds
    go to go paperless
    AppiumLibrary.click element   xpath=//android.widget.RadioButton[1]
    AppiumLibrary.element attribute should match      xpath=//android.widget.RadioButton[1]    checked   true
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   id=bt_continue
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'The following accounts are now Paperless!')]
    AppiumLibrary.click element   id=bt_continue
    AppiumLibrary.Wait Until Element Is Visible   xpath=//*[contains(@text,'My Money')]
    AppiumLibrary.capture page screenshot
    go to go paperless
    AppiumLibrary.element attribute should match      xpath=//android.widget.RadioButton[1]    checked   true
    # go to ROB

Tablet Go_Paperless_All_Account
    set appium timeout  30 seconds
    go to go paperless
    AppiumLibrary.click element    xpath=//*[contains(@text,'ALL')]/../android.widget.RadioButton
    AppiumLibrary.element attribute should match      xpath=//*[contains(@text,'ALL')]/../android.widget.RadioButton    checked   true
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   id=bt_continue
    run keyword and ignore error    AppiumLibrary.click element     id=android:id/button1
    AppiumLibrary.Wait Until Element Is Visible    xpath=//*[contains(@text,'OK')]
    AppiumLibrary.click element      xpath=//*[contains(@text,'OK')]
    AppiumLibrary.Wait Until Element Is Visible   xpath=//*[contains(@text,'My Money ')]
    AppiumLibrary.capture page screenshot
    go to go paperless
    # go to ROB
Go_Paperless_Any_Account
    set appium timeout  30 seconds
    [Arguments]  ${account1}
    go to go paperless
    AppiumLibrary.click element   xpath=//*[contains(@text,'${account1}')]/following-sibling::android.widget.RadioButton
    AppiumLibrary.element attribute should match      xpath=//*[contains(@text,'${account1}')]/following-sibling::android.widget.RadioButton    checked   true
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   id=bt_continue
    run keyword and ignore error    AppiumLibrary.click element     id=android:id/button1
    AppiumLibrary.wait until element is visible  id=com.sovereign.santander.pre:id/bt_continue
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   id=bt_continue
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money')]
    go to go paperless
    AppiumLibrary.element attribute should match   xpath=//*[contains(@text,'${account1}')]/following-sibling::android.widget.RadioButton   checked   true
    #Login_into_ROB  &{data}
Go_Paperless_Any_Some
    set appium timeout  30 seconds
    [Arguments]  ${AccountNumber1}   ${AccountNumber2}
    go to go paperless
    AppiumLibrary.click element   xpath=//*[contains(@text,'${AccountNumber1}')]/following-sibling::android.widget.RadioButton
    AppiumLibrary.click element   xpath=//*[contains(@text,'${AccountNumber2}')]/following-sibling::android.widget.RadioButton
    AppiumLibrary.element attribute should match   xpath=//*[contains(@text,'${AccountNumber1}')]/following-sibling::android.widget.RadioButton   checked   true
    AppiumLibrary.element attribute should match   xpath=//*[contains(@text,'${AccountNumber2}')]/following-sibling::android.widget.RadioButton   checked   true
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   id=bt_continue
    run keyword and ignore error    AppiumLibrary.click element     id=android:id/button1
    AppiumLibrary.wait until element is visible  id=com.sovereign.santander.pre:id/bt_continue
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   id=com.sovereign.santander.pre:id/bt_continue
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money')]
    go to go paperless
    AppiumLibrary.element attribute should match   xpath=//*[contains(@text,'${AccountNumber1}')]/following-sibling::android.widget.RadioButton   checked   true
    AppiumLibrary.element attribute should match   xpath=//*[contains(@text,'${AccountNumber2}')]/following-sibling::android.widget.RadioButton   checked   true
    # go to ROB
Tablet Go_Paperless_Any_Account
    [Arguments]  ${AccountNumber}
    set appium timeout  30 seconds
    go to go paperless
    AppiumLibrary.click element       //android.widget.TextView[@text,'${AccountNumber}']/../android.widget.RadioButton[1]
    get screenshot
    AppiumLibrary.wait until element is visible  name=Confirm
    get screenshot
    AppiumLibrary.click element     name=Confirm
    AppiumLibrary.Wait Until Element Is Visible   name=Yes
    AppiumLibrary.click element   name=Yes
    AppiumLibrary.wait until element is visible   name=OK
    AppiumLibrary.click element       name=OK
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money')]
    # go to ROB
Help_Options
    set appium timeout  30 seconds
    go to help
    AppiumLibrary.click element   xpath=//*[contains(@text,'Using the App')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What can I do using Mobile Banking?')]
    AppiumLibrary.page should contain text   Is Mobile Banking secure?
    AppiumLibrary.page should contain text   Do I need to be registered to use Mobile Banking?
    AppiumLibrary.page should contain text   How do I login to Mobile Banking?
    AppiumLibrary.page should contain text   Who can I contact if I have questions about Mobile Banking?
    AppiumLibrary.page should contain text   How do I register for Online Banking?
    AppiumLibrary.page should contain text   How can I remove my User ID from this device?
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Using the App')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Branch/ATM locator')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Branch/ATM locator')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What do the colored icons on the Locations page represent?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'What do the colored icons on the Locations page represent?')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Branches are identified with red pins, and all other locations with grey pins.')]
    get screenshot
    run keyword and ignore error  AppiumLibrary.click element    xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Branch/ATM locator')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Branch/ATM locator')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Transfers')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Transfers')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'How can I transfer money to someone else?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Transfers')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Mobile Check Deposit')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Mobile Check Deposit')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What is Mobile Check Deposit?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Mobile Check Deposit')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Credit Cards')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Credit Cards')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What is AutoPay?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Credit Cards')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Fingerprint Login')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Fingerprint Login')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What is Fingerprint Login?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Fingerprint Login')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Quick Balance')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Quick Balance')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What is Quick Balance?')]
    scroll element down to view   xpath=//*[contains(@text,'What should I know about Quick Balance?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Quick Balance')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Forgot your Password')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Forgot your Password')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What is Forgot Password?')]
    scroll element down to view  xpath=//*[contains(@text,'How can I reset my Password?')]
    get screenshot
Tablet Help_Options
    [Tags]  My_Money_Account_Details
    set appium timeout  30 seconds
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    AppiumLibrary.click element   id=action_menu
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Transfer Funds')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Help')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Using the App')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Using the App')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What can I do using Mobile Banking?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Using the App')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Branch/ATM locator')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Branch/ATM locator')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What do the colored icons on the Locations page represent?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'What do the colored icons on the Locations page represent?')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Branches are identified with red pins, and all other locations with grey pins.')]
    get screenshot
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Branch/ATM locator')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Branch/ATM locator')]
    get screenshot
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Transfers')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Transfers')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'How can I transfer money to someone else?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Transfers')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Mobile Check Deposit')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Mobile Check Deposit')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What is Mobile Check Deposit?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Mobile Check Deposit')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Credit Cards')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Credit Cards')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What is AutoPay?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Credit Cards')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Fingerprint Login')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Fingerprint Login')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What is Fingerprint Login?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Fingerprint Login')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Quick Balance')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Quick Balance')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What is Quick Balance?')]
    Scroll Element Down To View  xpath=//*[contains(@text,'What should I know about Quick Balance?')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Quick Balance')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Forgot your Password')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Forgot your Password')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'What is Forgot Password?')]
    Scroll Element Down To View  xpath=//*[contains(@text,'How can I reset my Password?')]
    get screenshot
Locations
    set appium timeout  30 seconds
    go to locations
    AppiumLibrary.wait until element is visible    id=button1
    AppiumLibrary.click element    id=button1
    AppiumLibrary.input text  id=et_search  02124
    AppiumLibrary.click element   id=et_search
    hide keyboard
    sleep  2s
    AppiumLibrary.wait until element is visible  id=et_search
#    AppiumLibrary.click element   id=bt_list
#    AppiumLibrary.wait until element is visible  xpath=//android.widget.RelativeLayout[1]
#    AppiumLibrary.capture page screenshot
#    AppiumLibrary.click element   xpath=//android.widget.RelativeLayout[1]
#    AppiumLibrary.wait until element is visible  id=iv_walk
#    AppiumLibrary.page should contain element  id=iv_car
#    AppiumLibrary.page should contain element  id=iv_walk


Tablet Locations

    [Tags]  Locations
    set appium timeout  30 seconds
    Go To Locations
    AppiumLibrary.input text  xpath=//*[contains(@resource-id,'et_search')]   02124
    AppiumLibrary.click element   xpath=//*[contains(@resource-id,'et_search')]
    hide keyboard
    sleep  2s
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@resource-id,'bt_list')]
    AppiumLibrary.click element   xpath=//*[contains(@resource-id,'bt_list')]
    AppiumLibrary.wait until element is visible  xpath=//android.widget.RelativeLayout[1]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'CVS')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@resource-id,'iv_walk')]
    AppiumLibrary.page should contain element  xpath=//*[contains(@resource-id,'iv_car')]
    #AppiumLibrary.click element   id=bt_walk


Posted Accounts
    set appium timeout  30 seconds
    [Documentation]  Open Mobile app
    [Arguments]  ${account}
    log  Select Account
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//android.widget.ImageView[@index='0']
    log  View Account Details
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'CURRENT BALANCE')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Activity')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'View Activity')]
    AppiumLibrary.wait until element is visible  xpath=//android.widget.RelativeLayout[@index=0]
    get screenshot
Tablet Posted Accounts
    set appium timeout  30 seconds
    [Documentation]  Open Mobile app
    [Arguments]  ${account}
    log  Select Account
    AppiumLibrary.click element    xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  xpath=//android.widget.ImageView[@index='0']
    log  View Account Details
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Account Details')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'View Account Details')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'CURRENT BALANCE')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Activity')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'View Activity')]
    AppiumLibrary.wait until element is visible  xpath=//android.widget.RelativeLayout[@index=0]
    get screenshot
View App Pages
    set appium timeout  30 seconds
    AppiumLibrary.click element   xpath=//*[contains(@resource-id,'id/action_menu')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    get screenshot
    AppiumLibrary.click element    xpath=//*[contains(@text,'Transfers Funds')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Between my accounts')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Between my accounts')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Date')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@resource-id,'id/action_menu')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'To someone else')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'To someone else')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Add new recipient')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@resource-id,'id/action_menu')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'BillPay')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'BillPay')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Single payment')]
    AppiumLibrary.click element    xpath=//*[contains(@text,'Single payment')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'No billers available')]