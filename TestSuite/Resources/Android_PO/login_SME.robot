*** Settings ***
Library     AppiumLibrary
Resource    ../Shared_Keywords.robot

*** Variables ***
${APPIUM_SERVER_URL}        http://0.0.0.0:4723/wd/hub
${PLATFORM_NAME}            Android
${PLATFORM_VERSION}         6.0
${DEVICE_NAME}              Android Emulator
${PACKAGE_NAME}             com.santander.us.sme.pre
${ACTIVITY_NAME}            com.santander.pruebas.SplashActivity

*** Keywords ***
Open_Nexus_5X
        set appium timeout  30 seconds
        open application  ${APPIUM_SERVER_URL}    platformName=${PLATFORM_NAME}   platformVersion=${PLATFORM_VERSION}      deviceName=${DEVICE_NAME}      appPackage=${PACKAGE_NAME}      automationName=appium       appActivity=${ACTIVITY_NAME}      noReset=true

Enter OrgID
    [Arguments]     ${org_id}
    wait until element is visible  id=com.santander.us.sme.pre:id/et_org_id
    input text  id=com.santander.us.sme.pre:id/et_org_id  ${org_id}
    hide keyboard

Enter UserID
    [Arguments]     ${user_id}
    wait until element is visible  id=com.santander.us.sme.pre:id/et_user_id
    input text  id=com.santander.us.sme.pre:id/et_user_id  ${user_id}
    hide keyboard
    scroll element down to view  id=com.santander.us.sme.pre:id/bt_continue
    click element  id=com.santander.us.sme.pre:id/bt_continue

Enter Random Question Answer
    wait until element is visible  id=com.santander.us.sme.pre:id/tv_question
    ${answer}   get login dynamic text  id=com.santander.us.sme.pre:id/tv_question
    wait until element is visible  id=com.santander.us.sme.pre:id/et_answer
    input text  id=com.santander.us.sme.pre:id/et_answer   ${answer}
    hide keyboard
    scroll element down to view  id=com.santander.us.sme.pre:id/bt_continue
    click element  id=com.santander.us.sme.pre:id/bt_continue

Enter Password
    [Arguments]     ${password}
    wait until element is visible  id=com.santander.us.sme.pre:id/et_password
    input text  id=com.santander.us.sme.pre:id/et_password  ${password}
    hide keyboard
    scroll element down to view  id=com.santander.us.sme.pre:id/bt_continue
    click element  id=com.santander.us.sme.pre:id/bt_continue

Log Off App
    wait until element is visible  id=com.santander.us.sme.pre:id/action_menu
    click element  id=com.santander.us.sme.pre:id/action_menu
    scroll element down to view  xpath=//android.widget.TextView[contains(@text,'Log off')]
    click element  xpath=//android.widget.TextView[contains(@text,'Log off')]
    wait until element is visible  id=com.santander.us.sme.pre:id/alertTitle
    click element  id=android:id/button1
    wait until element is visible  id=com.santander.us.sme.pre:id/bt_forgot_password

Login and Logout SME app
    [Arguments]     ${org_id}    ${user_id}     ${password}
    set appium timeout  30 seconds
    enter orgid  ${org_id}
    enter userid  ${user_id}
    enter random question answer
    enter password  ${password}
    Log Off App

