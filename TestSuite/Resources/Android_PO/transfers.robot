*** Settings ***
Library        AppiumLibrary
Library        robot.libraries.Collections
#Library        ExcelLibrary
Library         robot.libraries.String
Resource        ../Shared_Keywords.robot
Resource        ../Android_PO/main_menu.robot
Variables       ../../Lib/testdata.py
*** Keywords ***


Make Transfer Beetween Account
    [Arguments]  ${account1}  ${account2}
    set appium timeout  30 seconds
    log to console  ${account1}
    go to transfer between my accounts

    ${dicloc}  AppiumLibrary.get element location    id=carousel_accounts_to
    ${c1}    AppiumLibrary.get element size   id=carousel_accounts_to
    ${x}  get from dictionary   ${dicloc}   x
    ${y}  get from dictionary   ${dicloc}   y
    log to console  ${x}
    log to console  ${y}
    log to console  ${c1}
    select between my accounts   ${account1}  ${account2}
    AppiumLibrary.input text  id=et_amount    1.00
    run keyword and ignore error     AppiumLibrary.hide keyboard
    scroll element down to view   id=bt_continue
    get screenshot
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER DATE')]
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   id=tv_transaction_completed
    get screenshot
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   id=et_amount

Make Transfer Beetween Account Future
    [Arguments]  ${account1}  ${account2}  ${date_from}
    set appium timeout  30 seconds
    log to console  ${account1}
    go to transfer between my accounts
    select between my accounts   ${account1}  ${account2}
    AppiumLibrary.input text  id=et_amount    1.00
    run keyword and ignore error     AppiumLibrary.hide keyboard
    Scroll Element Down To View   id=bt_continue
    get screenshot
    AppiumLibrary.click element   id=et_date
    Set Transfers Older device Calendar Date  ${date_from}
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER DATE')]
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   id=tv_transaction_completed
    get screenshot
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   id=et_amount
Tablet Transfer Beetween Account Future
    [Arguments]  ${account1}  ${account2}  ${date_from}
    set appium timeout  30 seconds
    log to console  ${account1}
    go to transfer between my accounts
    select between my accounts   ${account1}  ${account2}
    AppiumLibrary.input text  id=et_amount    1.00
    run keyword and ignore error     AppiumLibrary.hide keyboard
    scroll element down to view   id=bt_continue
    get screenshot
    AppiumLibrary.click element   id=et_date
    Set Tablet Future Calendar Date  ${date_from}
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER DATE')]
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   id=tv_transaction_completed
    get screenshot
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   id=et_amount

Make Transfer To Someone else
    [Arguments]  ${account1}  ${account2}
    set appium timeout  30 seconds
    go to transfer to someone else
    select account from top slider  ${account1}
    Select Account For Someone_else Bottom Slider  ${account2}
    AppiumLibrary.input text  id=et_amount    0.12
    run keyword and ignore error     AppiumLibrary.hide keyboard
    scroll element down to view   id=bt_continue
    get screenshot
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER DATE')]
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   id=tv_transaction_completed
    get screenshot
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   id=et_amount

Make Transfer To Someone Else Future
    [Arguments]  ${account1}  ${account2}  ${date}
    set appium timeout  30 seconds
    go to transfer to someone else
    select account from top slider  ${account1}
    Select Account For Someone_else Bottom Slider  ${account2}
    AppiumLibrary.input text  id=et_amount    0.12
    run keyword and ignore error     AppiumLibrary.hide keyboard
    scroll element down to view   id=bt_continue
    get screenshot
    AppiumLibrary.click element   id=et_date
    Set Transfers Older device Calendar Date  ${date}
    scroll element down to view  id=bt_continue
    get screenshot
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER DATE')]
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   id=tv_transaction_completed
    get screenshot
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   id=et_amount

Tablet Transfer To Someone Else Future
    [Arguments]  ${account1}  ${account2}  ${date}
    set appium timeout  30 seconds
    go to transfer to someone else
    select account from top slider  ${account1}
    Select Account For Someone_else Bottom Slider  ${account2}
    AppiumLibrary.input text  id=et_amount    0.12
    run keyword and ignore error     AppiumLibrary.hide keyboard
    scroll down to view   id=bt_continue
    get screenshot
    AppiumLibrary.click element   id=et_date
    Set Tablet Future Calendar Date  ${date}
    get screenshot
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'TRANSFER DATE')]
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   id=tv_transaction_completed
    get screenshot
    AppiumLibrary.click element  id=bt_continue
    AppiumLibrary.wait until element is visible   id=et_amount

Select Account From Top Slider
     [Arguments]  ${account1}
       AppiumLibrary.page should contain element     xpath=//*[contains(@resource-id,'id/carousel_accounts_from')]
    : FOR    ${INDEX}    IN RANGE    1    5
      \  ${PRESENT}   run keyword and return status      AppiumLibrary.page should contain element     xpath=//*[contains(@resource-id,'id/carousel_accounts_from')]//android.widget.TextView[contains(@text,'${account1}')]
      \   run keyword if   ${PRESENT}  exit for loop   ELSE   AppiumLibrary.swipe  1000  614  100  614  2000

Select Account From Bottom Slider
      [Arguments]  ${my_account}

      ${count}  AppiumLibrary.get element size    xpath=//android.support.v4.view.ViewPager//*[contains(@resource-id,'tv_available_balance')][1]
      log to console  ${count}
      : FOR    ${INDEX}    IN RANGE    1    15
       \  ${present}   run keyword and return status         AppiumLibrary.element should be enabled       xpath=//android.support.v4.view.ViewPager[1]//android.widget.TextView[contains(@text,'${my_account}')]   #${my_account}
       \  log to console   ${present}
       \  run keyword if    ${present}    Exit For Loop     ELSE     AppiumLibrary.swipe  1000  1000  200  1000  2000
Select Account For Someone_else Bottom Slider
      [Arguments]  ${my_account}

      ${count}  AppiumLibrary.get element size    xpath=//android.support.v4.view.ViewPager//*[contains(@resource-id,'tv_available_balance')][1]
      log to console  ${count}
      : FOR    ${INDEX}    IN RANGE    1    15
       \  ${present}   run keyword and return status         AppiumLibrary.element should be enabled       xpath=//android.support.v4.view.ViewPager[1]//android.widget.TextView[contains(@text,'${my_account}')]   #${my_account}
       \  log to console   ${present}
       \  run keyword if    ${present}    Exit For Loop     ELSE     AppiumLibrary.swipe  1000  1200  100  1200  2000