*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource       ../common.robot

*** Keywords ***


List Of Statements
     set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    click element  id=action_menu
    wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    capture page screenshot
    scroll down to view  xpath=//*[contains(@text,'Statements & Documents')]
    click element  xpath=//*[contains(@text,'Statements & Documents')]
    scroll down to view  xpath=//*[contains(@text,'View Statements')]
    capture page screenshot
    click element  xpath=//*[contains(@text,'View Statements')]
    wait until element is visible  id=bt_filter
    capture page screenshot
    click element  id=com.santander.us.mob.pre:id/tv_description_secondary
    wait until element is visible  id=com.google.android.apps.docs:id/pdf_view
    capture page screenshot
    click element    xpath=//*[contains(@content-desc,'Navigate up')]
    wait until element is visible  id=bt_filter
    capture page screenshot
#   Color of statement should be green


Statements Search
   set appium timeout  10 seconds
    [Tags]  Statements   Search
    [Arguments]  ${account}    ${from_date}   ${to_date}
    wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    click element  id=action_menu
    wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    capture page screenshot
    scroll down to view  xpath=//*[contains(@text,'Statements & Documents')]
    click element  xpath=//*[contains(@text,'Statements & Documents')]
    scroll down to view  xpath=//*[contains(@text,'View Statements')]
    capture page screenshot
    click element  xpath=//*[contains(@text,'View Statements')]
    wait until element is visible  id=bt_filter
    capture page screenshot
    click element  com.santander.us.mob.pre:id/bt_filter
    wait until element is visible  id=com.santander.us.mob.pre:id/et_date_from
    click element   id=com.santander.us.mob.pre:id/et_date_from
    set calendar date  ${from_date}
    click element   id=com.santander.us.mob.pre:id/et_date_to
    set calendar date  ${to_date}
    click element    id=com.santander.us.mob.pre:id/spn_account
    wait until element is visible   xpath=//*[contains(@text,'Select …')]
    click element   xpath=//*[contains(@text,'${account}')]
    click element   id=bt_filter
    wait until element is visible    id=com.santander.us.mob.pre:id/bt_remove_filter
    click element  xpath=//*[contains(@text,'${account}')]
    wait until element is visible  id=com.google.android.apps.docs:id/pdf_view
    capture page screenshot
    click element    xpath=//*[contains(@content-desc,'Navigate up')]
    wait until element is visible  id=bt_filter
    capture page screenshot
    click element  id=com.santander.us.mob.pre:id/bt_remove_filter
    wait until element is visible    xpath=//*[contains(@text,'${account}')]


No Statements available
     set appium timeout  10 seconds
    [Tags]  No Statements available
    [Arguments]  ${account}    ${from_date}   ${to_date}
    wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    click element  id=action_menu
    wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    capture page screenshot
    scroll down to view  xpath=//*[contains(@text,'Statements & Documents')]
    click element  xpath=//*[contains(@text,'Statements & Documents')]
    scroll down to view  xpath=//*[contains(@text,'View Statements')]
    capture page screenshot
    click element  xpath=//*[contains(@text,'View Statements')]
    wait until element is visible  id=bt_filter
    capture page screenshot
    click element  com.santander.us.mob.pre:id/bt_filter
    wait until element is visible  id=com.santander.us.mob.pre:id/et_date_from
    click element   id=com.santander.us.mob.pre:id/et_date_from
    set calendar date  ${from_date}
    click element   id=com.santander.us.mob.pre:id/et_date_to
    set calendar date  ${to_date}
    click element    id=com.santander.us.mob.pre:id/spn_account
    wait until element is visible   xpath=//*[contains(@text,'Select …')]
    click element   xpath=//*[contains(@text,'${account}')]
    click element   id=bt_filter
    wait until element is visible    id=com.santander.us.mob.pre:id/bt_remove_filter
    page should contain text   There are no statements available for your accounts.
    capture page screenshot

Statements Search Negative
   set appium timeout  10 seconds
    [Tags]  Statements   Search
    [Arguments]  ${account}    ${from_date}   ${to_date}
    wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    click element  id=action_menu
    wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    capture page screenshot
    scroll down to view  xpath=//*[contains(@text,'Statements & Documents')]
    click element  xpath=//*[contains(@text,'Statements & Documents')]
    scroll down to view  xpath=//*[contains(@text,'View Statements')]
    capture page screenshot
    click element  xpath=//*[contains(@text,'View Statements')]
    wait until element is visible  id=bt_filter
    capture page screenshot
    click element  com.santander.us.mob.pre:id/bt_filter
    wait until element is visible  id=com.santander.us.mob.pre:id/et_date_from
    click element   id=com.santander.us.mob.pre:id/et_date_from
    set calendar date  ${from_date}
    click element   id=com.santander.us.mob.pre:id/et_date_to
    set calendar date  ${to_date}
    click element    id=com.santander.us.mob.pre:id/spn_account
    wait until element is visible   xpath=//*[contains(@text,'Select …')]
    click element   xpath=//*[contains(@text,'${account}')]
    click element   id=bt_filter
    wait until element is visible    xpath=//*[contains(@text,'The date range entered cannot be longer than 6 months.')]
    capture page screenshot
    click element  id=android:id/button1
    capture page screenshot











