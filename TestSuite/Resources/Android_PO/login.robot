*** Settings ***
Library        AppiumLibrary     # run_on_failure=AppiumLibrary.Capture Page Screenshot
#Library        ExcelLibrary
Resource        ../Shared_Keywords.robot
Resource        ../Android_PO/main_menu.robot
Variables       ../../Lib/testdata.py
*** Variables ***
#Appium Config
${APPIUM_SERVER_ANDROID_TABLET} =  http://localhost:4723/wd/hub
${APPIUM_SERVER_ANDROID_PHONE} =  http://localhost:4723/wd/hub
${APPIUM_SERVER_IOS_TABLET} =  http://localhost:4735/wd/hub
${APPIUM_SERVER_IOS_PHONE} =  http://localhost:4740/wd/hub
#${APPIUM_SERVER} =  0.0.0.0:8080/wd/hub
${PLATFORM_NAME} =  Android
${PLATFORM_VERSION} =  5.1.1
${DEVICE_NAME} =  4894f736
${PACKAGE_NAME} =   com.sovereign.santander.pre     #com.santander.us.mob.pre
${ACTIVITY_NAME} =   com.santander.pruebas.SplashActivity
${SCREENSHOTS} =    ..${/} Results  ${/}

*** Keywords ***

Lounch_Galaxy_S5
      set appium timeout  30 seconds
      AppiumLibrary.open application  ${APPIUM_SERVER_ANDROID_PHONE}   platformName=${PLATFORM_NAME}   platformVersion=5.1.1    deviceName=${DEVICE_NAME}     appPackage=${PACKAGE_NAME}      automationName=appium       appActivity=${ACTIVITY_NAME}
Lounch_Nexus_6_Sim_5.1.1
      set appium timeout  30 seconds
      AppiumLibrary.open application  ${APPIUM_SERVER_ANDROID_PHONE}   platformName=${PLATFORM_NAME}   platformVersion=5.1.1     deviceName=emulator-5554    appPackage=com.sovereign.santander.pre      automationName=appium       avd=Nexus_6_5.1.1      noReset=true        appActivity=com.santander.pruebas.SplashActivity
Lounch_Nexus_6P_Sim
      set appium timeout  30 seconds
      AppiumLibrary.open application  ${APPIUM_SERVER_ANDROID_PHONE}  platformName=${PLATFORM_NAME}   platformVersion=7.1.1       appPackage=com.sovereign.santander.pre      automationName=appium       avd=Nexus_6P_API_25       noReset=true        appActivity=com.santander.pruebas.SplashActivity
Launch_Galaxy_S7_Sim
      set appium timeout  30 seconds
      AppiumLibrary.open application  http://localhost:4723/wd/hub    platformName=${PLATFORM_NAME}   platformVersion=6.0     deviceName=emulator-5554    appPackage=com.sovereign.santander.pre      automationName=appium       avd=Galaxy_S7_API_23      noReset=true        appActivity=com.santander.pruebas.SplashActivity    androidCoverage=android.support.test.runner.AndroidJUnitRunner

Lounch_Samsung_Tablet
      set appium timeout  30 seconds
      AppiumLibrary.open application  ${APPIUM_SERVER_ANDROID_TABLET}    platformName=${PLATFORM_NAME}   platformVersion=6.0.1    deviceName=3300576c43262255     appPackage=com.sovereign.santander.pre      automationName=appium       appActivity=${ACTIVITY_NAME}      noReset=true    disableAndroidWatchers=true   androidCoverage=com.my.Pkg/com.my.Pkg.instrumentation.MyInstrumentation
Lounch_Nexus7
      set appium timeout  30 seconds
      AppiumLibrary.open application  http://localhost:4723/wd/hub    platformName=${PLATFORM_NAME}   platformVersion=7.0    deviceName=Android Simulator      appPackage=com.sovereign.santander.pre      automationName=appium       appActivity=${ACTIVITY_NAME}      noReset=true    avd=Pixel_C_API_24           disableAndroidWatchers=true
Open_Nexus6P
      set appium timeout  30 seconds
      AppiumLibrary.open application  http://localhost:4723/wd/hub
     ...  platformName=android
     ...  platformVersion=7.1.1
     ...  deviceName=Android Simulator
     ...  appPackage=com.sovereign.santander.pre
     ...  automationName=appium
     ...  appActivity=com.santander.pruebas.SplashActivity
     ...  noReset=true
     ...  avd=Nexus_6P_API_25
    # ...  disableAndroidWatchers=true
Open_Nexus5X
      set appium timeout  30 seconds
      AppiumLibrary.open application  http://0.0.0.0:4723/wd/hub
     ...  platformName=android
     ...  platformVersion=6.0
     ...  deviceName=Android Simulator
     ...  appPackage=com.sovereign.santander.pre
     ...  automationName=appium
     ...  appActivity=com.santander.pruebas.SplashActivity
     ...  noReset=true
     ...  avd=Nexus5X_API_23
     ...  disableAndroidWatchers=true

Open_Nexus9
      set appium timeout  30 seconds
      AppiumLibrary.open application  http://localhost:4723/wd/hub
     ...  platformName=${PLATFORM_NAME}
     ...  platformVersion=6.0
     ...  deviceName=Android Simulator
     ...  appPackage=com.sovereign.santander.pre
     ...  automationName=appium
     ...  appActivity=${ACTIVITY_NAME}
     ...  noReset=true
     ...  avd=Nexus_9_API_23
     ...  disableAndroidWatchers=true


Start Tablet Existing activity
      set appium timeout  30 seconds
      AppiumLibrary.open application  ${APPIUM_SERVER}  platformName=${PLATFORM_NAME}   platformVersion=5.0.2    deviceName=3300576c43262255     appPackage=com.sec.android.app.launcher     automationName=appium       appActivity=com.android.launcher2.Launcher
      AppiumLibrary.wait until element is visible      xpath=//*[contains(@text,'MOB PRE')]
      AppiumLibrary.click element   xpath=//*[contains(@text,'MOB PRE')]
Start Phone Existing activity
      set appium timeout  30 seconds
      ${appium1}=    AppiumLibrary.open application     http://localhost:4723/wd/hub   alias=launcher   platformName=${PLATFORM_NAME}   platformVersion=5.1.1    deviceName=4894f736     appPackage=com.sec.android.app.launcher    automationName=appium      noReset=true    appActivity=com.android.launcher2.Launcher   # noReset=true
      AppiumLibrary.wait until element is visible      xpath=//*[contains(@text,'R PRE 4.1.5.3')]
      AppiumLibrary.click element   xpath=//*[contains(@text,'R PRE 4.1.5.3')]

Add user id
    [Arguments]  ${user}
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@resource-id,'et_user_id')]
     Get Screenshot
     AppiumLibrary.input text   xpath=//*[contains(@resource-id,'et_user_id')]   ${user}
     AppiumLibrary.hide keyboard
     Get Screenshot
     Scroll Element Down To View  id=bt_continue
     AppiumLibrary.click element  id=bt_continue
     AppiumLibrary.wait until element is visible   id=et_answer
      Get Screenshot
Only Add User Id text
    [Arguments]  ${user}
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@resource-id,'et_user_id')]
     Get Screenshot
     AppiumLibrary.input text   id=et_user_id   ${user}
     AppiumLibrary.hide keyboard

Add user id and remember credential
    [Arguments]  ${user}
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@resource-id,'et_user_id')]
     Get Screenshot
     AppiumLibrary.input text   id=et_user_id   ${user}
     AppiumLibrary.hide keyboard
     AppiumLibrary.click element   id=cb_remember_user
     Get Screenshot
     Scroll Element Down To View  id=bt_continue
     AppiumLibrary.click element  id=bt_continue
Add Login Answer
    [Arguments]   ${answer}
    AppiumLibrary.wait until element is visible   id=et_answer
    Get Screenshot
    AppiumLibrary.input text   id=et_answer    ${answer}
     AppiumLibrary.hide keyboard
     Scroll Element Down To View  id=bt_continue
     AppiumLibrary.click element   id=bt_continue

Add Login Password
    [Arguments]  ${password}
    AppiumLibrary.wait until element is visible  id=et_password
     Get Screenshot
     AppiumLibrary.input text     id=et_password      ${password}
     AppiumLibrary.hide keyboard
     Scroll Element Down To View  id=bt_continue
     AppiumLibrary.click element  id=bt_continue
     AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'My Money')]
     Get Screenshot

Login_App
    [Arguments]  ${user}   ${answer}    ${password}
     set appium timeout  30 seconds
     Add user id  ${user}
     run keyword and ignore error   Add Login Answer  ${answer}
     Add Login Password  ${password}

Login_App And Remember Credential
    [Arguments]  ${user}   ${answer}    ${password}
     Add user id and remember credential  ${user}
     Add Login Answer  ${answer}
     Add Login Password  ${password}
Login with Dict
    [Arguments]    &{data}
    [Documentation]  Open Banking app
     set appium timeout  30 seconds
     AppiumLibrary.wait until element is visible  id=et_user_id
     AppiumLibrary.capture page screenshot
     AppiumLibrary.input text     id=et_user_id     ${data.user}
     AppiumLibrary.capture page screenshot
     AppiumLibrary.click element     id=bt_continue
     AppiumLibrary.wait until element is visible   id=et_answer
     AppiumLibrary.capture page screenshot
     AppiumLibrary.input text   id=et_answer    ${data.answer}
     AppiumLibrary.hide keyboard
     AppiumLibrary.click element   id=bt_continue
     AppiumLibrary.wait until element is visible  id=et_password
     AppiumLibrary.capture page screenshot
     AppiumLibrary.input text     id=et_password      ${data.password}
     AppiumLibrary.hide keyboard
     AppiumLibrary.click element  id=bt_continue
     AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'My Money')]
     AppiumLibrary.capture page screenshot

Login Into Tablet
    [Arguments]  ${user}   ${answer}    ${password}
    [Documentation]  Open Banking app
    set appium timeout  60 seconds
    AppiumLibrary.wait until page contains  Enter your Online Banking User ID
    Get Screenshot
    AppiumLibrary.input text    id=et_user_id   ${user}
    AppiumLibrary.hide keyboard
    Get Screenshot
    AppiumLibrary.click element    id=bt_continue
    AppiumLibrary.wait until page contains   This is a device I use frequently.
    Get Screenshot
    AppiumLibrary.input text     id=et_answer     ${answer}
    AppiumLibrary.hide keyboard
    Scroll Element Down To View           id=bt_continue
    AppiumLibrary.click element   id=bt_continue
    AppiumLibrary.wait until page contains   enter your Online Banking Password.
    Get Screenshot
    Scroll Element Down To View   id=et_password
    AppiumLibrary.input text    id=et_password    ${password}
    AppiumLibrary.hide keyboard
    Scroll Element Down To View           id=bt_continue
    AppiumLibrary.click element   id=bt_continue
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money')]
    Get Screenshot

Incorrect User Id
    [Arguments]    ${user}   ${answer}   ${password}
    [Documentation]  Open Banking app
    AppiumLibrary.set appium timeout  30 seconds
    AppiumLibrary.wait until element is visible   id=et_user_id
    AppiumLibrary.input text   id=et_user_id    ${user}
    AppiumLibrary.hide keyboard
    get screenshot
    AppiumLibrary.click element   id=bt_continue
    AppiumLibrary.wait until element is visible     id=et_password
    get screenshot
    AppiumLibrary.input text   id=et_password   ${password}
    AppiumLibrary.hide keyboard
    AppiumLibrary.click element     id=bt_continue
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'The user ID and/or password is incorrect. Please try again.')]
    get screenshot
    AppiumLibrary.click element  xpath=//*[contains(@text,'OK')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'If your SSA personal security image and phrase are correct, enter your Online Banking Password.')]


Incorrect Password
     [Arguments]  ${user_id}   ${answer}    ${password}
    [Documentation]  Open Banking app
    AppiumLibrary.set appium timeout  30 seconds
    AppiumLibrary.Wait Until Element Is Visible  id=et_user_id
    AppiumLibrary.input text   id=et_user_id   ${user_id}
    AppiumLibrary.hide keyboard
    get screenshot
    AppiumLibrary.click element  id=bt_continue
     AppiumLibrary.wait until page contains    This is a device I use frequently.
   # AppiumLibrary.wait until element is visible   id=et_answer
    get screenshot
    AppiumLibrary.input text   id=et_answer    ${answer}
    AppiumLibrary.hide keyboard
    AppiumLibrary.click element   id=bt_continue
    AppiumLibrary.wait until element is visible  id=et_password
    get screenshot
    AppiumLibrary.input text    id=et_password     ${password}
    AppiumLibrary.hide keyboard
    AppiumLibrary.click element    id=bt_continue
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Error')]
    get screenshot
    AppiumLibrary.click element  xpath=//*[contains(@text,'OK')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'If your SSA personal security image and phrase are correct, enter your Online Banking Password.')]

Main Login Page
      [Arguments]  ${user_id}   ${answer}    ${password}
     Login_App  ${user_id}   ${answer}    ${password}

Log Off To Quick Settings
    set appium timeout  30 seconds
    go to logoff
    AppiumLibrary.click element     id=button1
    AppiumLibrary.wait until element is visible   bt_logon
    get screenshot

Log Off
    set appium timeout  30 seconds
    go to logoff
    AppiumLibrary.click element     id=button1
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Enter your Online Banking User ID')]
    get screenshot
Tablet Log Off
     set appium timeout  20 seconds
    [Tags]  My_Money_Account_Details
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'My Money ')]
    log  My money botton is visible
    AppiumLibrary.click element   xpath=//*[contains(@resource-id,'action_menu')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Statements & Documents')]
    Scroll Element Down To View  xpath=//android.widget.LinearLayout/*[contains(@text,'Log off')]
     get screenshot
    AppiumLibrary.click element  xpath=//android.widget.LinearLayout/*[contains(@text,'Log off')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Are you sure you want to log off?')]
     get screenshot
    AppiumLibrary.click element  xpath=//*[contains(@resource-id,'button1')]
    AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Enter your Online Banking User ID')]
     get screenshot