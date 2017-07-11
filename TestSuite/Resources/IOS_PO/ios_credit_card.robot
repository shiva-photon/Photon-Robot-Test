*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource       ../common.robot
Resource       ios_overview.robot
*** Keywords ***


Validate I Want To Options
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
Account Overview
    [Arguments]  ${account}
    ios_overview.Validate Overview Elements
    ios_overview.Select Credit Card Account   ${account}
Account Details
    #set appium timeout  30 seconds
    [Arguments]  ${account}
    [Tags]  My_Money_Account_Details
    AppiumLibrary.wait until element is visible   name=My Money
    log  My money botton is visible
    ios_overview.Select Credit Card Account   ${account}
    Validate I Want To Options
    AppiumLibrary.click element    account_details_btn
    AppiumLibrary.wait until element is visible   view_act_btn
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  view_act_btn
    AppiumLibrary.page should contain element   Current Balance
    AppiumLibrary.page should contain element   Today's Deposits
    AppiumLibrary.page should contain element   Today's Withdrawals
    AppiumLibrary.capture page screenshot

Single Payment Future
    [Arguments]  ${account}  ${amount}  ${date_from}
    ios_overview.Select Credit Card Account   ${account}
    AppiumLibrary.wait until element is visible  i_want_to_btn
    AppiumLibrary.click element    i_want_to_btn
    AppiumLibrary.wait until element is visible   make_payment_btn
    AppiumLibrary.click element   make_payment_btn
    AppiumLibrary.wait until element is visible   single_payment_btn
    AppiumLibrary.click element  single_payment_btn
    AppiumLibrary.wait until element is visible    Other Amount
    AppiumLibrary.click element    //XCUIElementTypeTextField[1]
    AppiumLibrary.input text   //XCUIElementTypeTextField[1]      ${amount}
    ${Present}   run keyword and return status    AppiumLibrary.page should contain element     Continue
    run keyword if   ${Present}   AppiumLibrary.click element   AMOUNT   ELSE  AppiumLibrary.hide keyboard
    #AppiumLibrary.hide keyboard
    get screenshot
    Shared_Keywords.Scroll Element Down To View  Continue
    AppiumLibrary.click element    et_pay_date
    Set Tablet Future Calendar Date  ${date_from}
    AppiumLibrary.click element   bt_continue
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Confirm')]
    AppiumLibrary.click element  bt_continue
    AppiumLibrary.wait until element is visible   tv_transaction_completed
    AppiumLibrary.click element  bt_continue
    AppiumLibrary.wait until element is visible  iv_menu_arrow
