*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource       ../common.robot

*** Variables ***
${SCREENSHOTS}     ../IOS_Results${/}filename=${TEST_NAME}-{index}.png
*** Keywords ***

Account Overview Iphone
    set appium timeout  20 seconds
    [Documentation]  Open Mobile app
    [Tags]  My_Money_Account_Overview
    [Arguments]   ${Account}
    Validate Overview Elements
    ios_overview.Select Account Number   ${Account}
    AppiumLibrary.wait until element is visible      name=i_want_to_btn
    log  User collpases the Drop Down for Credit Cards
    AppiumLibrary.capture page screenshot
    common.Return To Overview

Ipad Account Overview
    [Tags]  My_Money_Account_Overview
    [Arguments]   ${Account}
    Validate Overview Elements
    Select Credit Card Account  ${Account}
    AppiumLibrary.wait until element is visible      name=I WANT TO...
    log  User collpases the Drop Down for Credit Cards
    AppiumLibrary.capture page screenshot
    common.Return To Overview

Validate Overview Elements
    AppiumLibrary.wait until element is visible      My Money
    AppiumLibrary.page should contain element      company_logo
    log  Santander logo is visible
    AppiumLibrary.page should contain element       menu_btn
    log  Menu Butoon is visible
    AppiumLibrary.page should contain element      name=My Money
    log  My money is visible
    AppiumLibrary.page should contain element      name=coin_stack
    log  coin stack is visible
    AppiumLibrary.page should contain element      total_account_balance
    log  Total Amount is visible
    AppiumLibrary.capture page screenshot

Select Account Number
    [Arguments]  ${account}
    common.Scroll Down To View            name=${account}
    AppiumLibrary.click element         name=${account}
    AppiumLibrary.wait until element is visible    name=i_want_to_btn
    AppiumLibrary.capture page screenshot
Select Credit Card Account
    [Arguments]  ${account}

    ${t}   AppiumLibrary.get matching xpath count    //XCUIElementTypeButton["wdName==open_collapse_btn"]
    log to console  ${t}
    common.Scroll Down To View           accessibility_id=Credit Cards

    AppiumLibrary.click element          //XCUIElementTypeOther[2]
    #AppiumLibrary.click element          name=Credit Cards
    sleep  2s
    common.Scroll Down To View          name=${account}
    AppiumLibrary.click element         name=${account}
    AppiumLibrary.wait until element is visible   i_want_to_btn
    AppiumLibrary.capture page screenshot