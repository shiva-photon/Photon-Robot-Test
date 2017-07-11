*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource       ../Shared_Keywords.robot
*** Keywords ***


View Account Details
     [Arguments]  ${account1}
    Page Should Contain Text       My Money
    log  My money botton is visible
    Select Credit Card Account   ${account1}
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'I WANT TO …')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Statements')]
    get screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Make a Payment')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Single Payment')]
    get screenshot
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Autopay')]
    AppiumLibrary.page should contain element    xpath=//*[contains(@text,'Manage Cards')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'View Credit Card Details')]
    AppiumLibrary.click element  xpath=//*[contains(@text,'View Credit Card Details')]
    AppiumLibrary.wait until page contains  FULL CARD NUMBER
    AppiumLibrary.page should contain text  CURRENT BALANCE
    AppiumLibrary.page should contain text  AVAILABLE CREDIT
    AppiumLibrary.page should contain text  LAST STATEMENT BALANCE
    AppiumLibrary.page should contain text  LAST PAYMENT RECEIVED
    AppiumLibrary.click element        id=bt_value
    get screenshot
    AppiumLibrary.go back
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'I WANT TO …')]
    get screenshot
    AppiumLibrary.wait until element is visible  id=container_button_filter
    Return To Overview

Single Payment
    [Arguments]  ${account}  ${amount}
    Select Credit Card Account  ${account}
    AppiumLibrary.click element  iv_menu_arrow
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'Make a Payment')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Make a Payment')]
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.wait until element is visible   carousel_accounts
    AppiumLibrary.click element   xpath=//*[contains(@text,'Other amount')]
    AppiumLibrary.input text   et_amount   ${amount}
    AppiumLibrary.click element   xpath=//*[contains(@text,'AMOUNT')]
    Shared_Keywords.Scroll Element Down To View  bt_continue
    AppiumLibrary.click element   bt_continue
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Confirm')]
    AppiumLibrary.click element  bt_continue
    AppiumLibrary.wait until element is visible   tv_transaction_completed
    AppiumLibrary.click element  bt_continue
    AppiumLibrary.wait until element is visible  iv_menu_arrow
Single Payment Future
    [Arguments]  ${account}  ${amount}  ${date_from}
    Select Credit Card Account  ${account}
    AppiumLibrary.click element  iv_menu_arrow
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'Make a Payment')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Make a Payment')]
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'Single Payment')]
    AppiumLibrary.wait until element is visible   carousel_accounts
    AppiumLibrary.click element   xpath=//*[contains(@text,'Other amount')]
    AppiumLibrary.input text   et_amount   ${amount}
    ${Present}   run keyword and return status    AppiumLibrary.page should contain element     bt_continue
    run keyword if   ${Present}   AppiumLibrary.click element   xpath=//*[contains(@text,'AMOUNT')]  ELSE  AppiumLibrary.hide keyboard
    #AppiumLibrary.hide keyboard
    get screenshot
    Shared_Keywords.Scroll Element Down To View  bt_continue
    AppiumLibrary.click element    et_pay_date
    Set Tablet Future Calendar Date  ${date_from}
    AppiumLibrary.click element   bt_continue
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Confirm')]
    AppiumLibrary.click element  bt_continue
    AppiumLibrary.wait until element is visible   tv_transaction_completed
    AppiumLibrary.click element  bt_continue
    AppiumLibrary.wait until element is visible  iv_menu_arrow





