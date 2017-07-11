*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource       ../Shared_Keywords.robot
Resource       ../Android_PO/main_menu.robot
*** Keywords ***


Online Banking Service Agreement
     set appium timeout  30 seconds
    go to online banking service agreement
    log   check screen shots for validation
    AppiumLibrary.capture page screenshot
Tablet Online Banking Service Agreement
    [Tags]  My_Money_Account_Details
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    AppiumLibrary.click element   xpath=//*[contains(@resource-id,'action_menu')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  xpath=//*[contains(@text,'Terms of Use')]
    Scroll Element Down To View  xpath=//*[contains(@text,'Online Banking Service Agreement')]
    AppiumLibrary.click element  xpath=//*[contains(@text,'Online Banking Service Agreement')]
    AppiumLibrary.wait until element is visible  id=com.google.android.apps.docs:id/content_container
    log   check screen shots for validation
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element     xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    AppiumLibrary.capture page screenshot
Privacy Policy
    set appium timeout  30 seconds
    go to privacy policy
    AppiumLibrary.wait until element is visible     id=android:id/content
    #Page Should Contain Text    Privacy Information Heading
    log   check screen shots for validation
    AppiumLibrary.capture page screenshot
Tablet Privacy Policy
     set appium timeout  20 seconds
    [Tags]  My_Money_Account_Details
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    AppiumLibrary.click element   xpath=//*[contains(@resource-id,'action_menu')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  xpath=//*[contains(@text,'Terms of Use')]
    Scroll Element Down To View  xpath=//*[contains(@text,'Privacy Policy')]
    AppiumLibrary.click element  xpath=//*[contains(@text,'Privacy Policy')]
    get current context
    AppiumLibrary.wait until element is visible    id=com.sec.android.app.sbrowser:id/sbrowser_content_view_holder
    log   check screen shots for validation
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element     xpath=//*[contains(@content-desc,'Navigate up')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    AppiumLibrary.capture page screenshot

Terms of use
    set appium timeout  30 seconds
    go to sub terms of use
    get screenshot
#need to fix click on term of use
Tablet Terms of use
    set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    AppiumLibrary.click element   xpath=//*[contains(@resource-id,'action_menu')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Transfer Funds')]
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   xpath=//*[contains(@text,'Terms of Use')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Online Banking Service Agreement')]
    Scroll Element Down To View  xpath=//*[contains(@text,'Privacy Policy')]
    AppiumLibrary.click element     xpath=//android.widget.RelativeLayout/*[contains(@text,'Terms of Use')]
    AppiumLibrary.wait until element is visible    id=com.android.chrome:id/refresh_button
    AppiumLibrary.capture page screenshot

