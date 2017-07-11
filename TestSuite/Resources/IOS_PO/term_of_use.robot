*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource       ../common.robot

*** Keywords ***


Online Banking Service Agreement
     set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    click element  id=action_menu
    wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    capture page screenshot
    click element  xpath=//*[contains(@text,'Terms of use')]
    scroll down to view  xpath=//*[contains(@text,'Online Banking Service Agreement')]
    click element  xpath=//*[contains(@text,'Online Banking Service Agreement')]
    wait until element is visible  id=com.google.android.apps.docs:id/content_container
    log   check screen shots for validation
    capture page screenshot

Privacy Policy
     set appium timeout  20 seconds
    [Tags]  My_Money_Account_Details
    wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    click element  id=action_menu
    wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    capture page screenshot
    click element  xpath=//*[contains(@text,'Terms of use')]
    scroll down to view  xpath=//*[contains(@text,'Privacy Policy')]
    click element  xpath=//*[contains(@text,'Privacy Policy')]
    get current context
    wait until element is visible    id=com.sec.android.app.sbrowser:id/sbrowser_content_view_holder
    log   check screen shots for validation
    capture page screenshot

Terms of use
    set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    click element  id=action_menu
    wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
    capture page screenshot
    click element  xpath=//*[contains(@text,'Terms of use')]
    wait until element is visible  xpath=//*[contains(@text,'Online Banking Service Agreement')]
    scroll down to view  xpath=//*[contains(@text,'Privacy Policy')]
     @{ELEMENTS}    get webelements     xpath=//*[contains(@text,'Terms of use')]
    click element   @{ELEMENTS}[3]
    wait until element is visible    id=com.sec.android.app.sbrowser:id/sbrowser_content_view_holder
    capture page screenshot
#need to fix click on term of use

