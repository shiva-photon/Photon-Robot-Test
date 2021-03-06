*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource       ../Shared_Keywords.robot
Resource       ../Android_PO/main_menu.robot
*** Keywords ***


List Of Statements
     set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    main_menu.Go To View Statements
    AppiumLibrary.get current context
    AppiumLibrary.page should not contain text    There are no statements available for your accounts.
    @{ELEMENTS}      AppiumLibrary.Get Webelements      id=tv_date
    AppiumLibrary.click element   @{ELEMENTS}[1]
    AppiumLibrary.wait until element is visible  id=com.google.android.apps.docs:id/pdf_view
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element    xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible  id=bt_filter
    AppiumLibrary.capture page screenshot
#   Color of statement should be green
Tablet List Of Statements
     set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    main_menu.Go To Tablet View Statements
    AppiumLibrary.click element  id=tv_description
    AppiumLibrary.wait until element is visible  id=com.google.android.apps.docs:id/pdf_view
    get screenshot
    AppiumLibrary.go back
    AppiumLibrary.wait until element is visible  id=bt_apply
    get screenshot
#   Color of statement should be green

Statements_Search
   set appium timeout  30 seconds
    [Tags]  Statements   Search
    [Arguments]  ${account}    ${from_date}   ${to_date}
    main_menu.Go To View Statements
    AppiumLibrary.get current context
    AppiumLibrary.page should not contain text    There are no statements available for your accounts.
    AppiumLibrary.click element  id=bt_filter
    AppiumLibrary.wait until element is visible    id=et_date_from
    AppiumLibrary.click element    id=et_date_from
    set calendar date  ${from_date}
    AppiumLibrary.click element   id=et_date_to
    set calendar date  ${to_date}
    AppiumLibrary.click element    id=spn_account
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'Select …')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element   id=bt_filter
    AppiumLibrary.wait until element is visible    id=bt_remove_filter
    AppiumLibrary.click element  xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.wait until element is visible  id=com.google.android.apps.docs:id/pdf_view
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element    xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible  id=bt_filter

Tablet Statements_Search
   set appium timeout  30 seconds
    [Tags]  Statements   Search
    [Arguments]  ${account}    ${from_date}   ${to_date}
    main_menu.Go To Tablet View Statements
    AppiumLibrary.wait until element is visible    id=et_date_from
    AppiumLibrary.click element    id=et_date_from
    Set Tablet Past Calendar Date  ${from_date}
    AppiumLibrary.click element   id=com.sovereign.santander.pre:id/et_date_to
    Set Tablet Past Calendar Date  ${to_date}
    AppiumLibrary.click element    id=spn_account
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'Select …')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element   id=bt_apply

Validate Statement Details
    AppiumLibrary.wait until element is visible    id=bt_remove_filter
    AppiumLibrary.click element  id=tv_description
    AppiumLibrary.wait until element is visible  id=com.google.android.apps.docs:id/pdf_view
   get screenshot
    AppiumLibrary.click element    xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible  id=bt_apply
   get screenshot


Validate No_Statements_Available
    AppiumLibrary.wait until element is visible    id=bt_remove_filter
    page should contain text   There are no statements available for your accounts.
    get screenshot
Tablet No Statements available
     set appium timeout  10 seconds
    [Tags]  No Statements available
    [Arguments]  ${account}    ${from_date}   ${to_date}
    Tablet Statements_Search  ${account}    ${from_date}   ${to_date}
    Tablet Statements Search Negative
Statements Search Negative
    set appium timeout  30 seconds
    [Documentation]  Search for transactions over 6 months. not expected to return any
    [Arguments]  ${account}    ${from_date}   ${to_date}
    main_menu.Go To View Statements
    AppiumLibrary.get current context
    AppiumLibrary.page should not contain text    There are no statements available for your accounts.
    AppiumLibrary.wait until element is visible  id=bt_filter
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element     id=bt_filter
    AppiumLibrary.wait until element is visible  id=et_date_from
    AppiumLibrary.click element    id=et_date_from
    set calendar date  ${from_date}
    AppiumLibrary.click element   id=et_date_to
    set calendar date  ${to_date}
    AppiumLibrary.click element    id=spn_account
    AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'Select …')]
    AppiumLibrary.click element   xpath=//*[contains(@text,'${account}')]
    AppiumLibrary.click element   id=bt_filter
    AppiumLibrary.wait until element is visible    xpath=//*[contains(@text,'The date range entered cannot be longer than 6 months.')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  id=android:id/button1
    AppiumLibrary.capture page screenshot

Tablet Statements Search Negative
   set appium timeout  10 seconds
    [Tags]  Statements   Search
    AppiumLibrary.wait until element is visible    xpath=//*[contains(@text,'The date range entered cannot be longer than 6 months.')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  id=android:id/button1
    get screenshot











