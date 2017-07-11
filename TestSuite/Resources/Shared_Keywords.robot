*** Settings ***
Library        AppiumLibrary
Library        robot.libraries.Collections
#Library        ExcelLibrary
Library         DateTime
Library         ../Lib/MyLibrary.py




*** Variables ***
#Appium Config
${APPIUM_SERVER} =  http://localhost:4723/wd/hub
${PLATFORM_NAME} =  Android
${PLATFORM_VERSION} =  5.1.1
${DEVICE_NAME} =  4894f736
${PACKAGE_NAME} =  com.santander.us.mob.pre
${ACTIVITY_NAME} =  com.santander.pruebas.SplashActivity
${transfer_date} =  18 March 2017
@{MONTHNAME}  ['01':'January'   '02':'Februrary'   '03':'March']   #April   May   June   July   August   September   October   November   December




#C:\Users\x368871\AppData\Local\Android\Sdk
*** Keywords ***
Log Out App
     AppiumLibrary.click element  xpath=//*[contains(@resource-id,'id/action_menu')]
     AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Transfers Funds')]
     scroll down  xpath=//*[contains(@text,'Log off')]
     AppiumLibrary.click element  xpath=//*[contains(@text,'Log off')]
     AppiumLibrary.wait until element is visible  xpath=//*[contains(@text,'Are you sure you want to log off?')]
     AppiumLibrary.click element  xpath=//android.widget.Button[@text,'OK')]
     AppiumLibrary.wait until element is visible  xpath=//android.widget.Button[@text,'Forgot your password?')]

Return To Overview
    : FOR    ${INDEX}    IN RANGE    1    10
       \  ${present}  run keyword and return status           AppiumLibrary.page should contain element    xpath=//*[contains(@text,'My Money')]
       \  run keyword if  ${present}  Exit For Loop   ELSE    AppiumLibrary.click element                 accessibility_id=Navigate up
    get screenshot

Scroll Element Down To View
    [Arguments]  ${ELEMENT}
     : FOR    ${INDEX}    IN RANGE    1    15
       \  ${present}  run keyword and return status  AppiumLibrary.page should contain element    ${ELEMENT}
       \  run keyword if  ${present}  Exit For Loop  ELSE  swipe element up

Scroll Down To View
    [Arguments]  ${ELEMENT}
     : FOR    ${INDEX}    IN RANGE    1    15
       \  ${present}  run keyword and return status  AppiumLibrary.page should contain element    ${ELEMENT}
       \  run keyword if  ${present}  Exit For Loop  ELSE  dynamic swip up  animator
Scroll Up To View
    [Arguments]  ${ELEMENT}
     : FOR    ${INDEX}    IN RANGE    1    20
       \  ${present}  run keyword and return status  AppiumLibrary.page should contain element    ${ELEMENT}
       #\  run keyword if  ${present}  Exit For Loop  ELSE   drag_object_down   id=animator
       \  run keyword if  ${present}  Exit For Loop  ELSE  Dynamic Swip Down  animator
       \  sleep  2s
Scroll Left To View
    [Arguments]  ${ELEMENT}
     : FOR    ${INDEX}    IN RANGE    1    15
       \  ${present}  run keyword and return status  AppiumLibrary.page should contain element    ${ELEMENT}
       \  run keyword if  ${present}  Exit For Loop  ELSE  Swipe Element Left
Scroll Right To View
    [Arguments]  ${ELEMENT}
     : FOR    ${INDEX}    IN RANGE    1    15
       \  ${present}  run keyword and return status  AppiumLibrary.page should contain element    ${ELEMENT}
       \  run keyword if  ${present}  Exit For Loop  ELSE  Swipe Element Left
Tablet Scroll Up To View
    [Arguments]  ${ELEMENT}
     : FOR    ${INDEX}    IN RANGE    1    10
       \  ${present}  run keyword and return status  AppiumLibrary.page should contain element    ${ELEMENT}
       #\  run keyword if  ${present}  Exit For Loop  ELSE   drag_object_down   id=animator
       \  run keyword if  ${present}  Exit For Loop  ELSE  AppiumLibrary.swipe  1511   607   0  932  500



For-Loop-In-Range
    : FOR    ${INDEX}    IN RANGE    1    3
    \    Log    ${INDEX}
    \    ${RANDOM_STRING}=    Generate Random String    ${INDEX}
    \    Log    ${RANDOM_STRING}

For-Loop-Elements
    @{ITEMS}    Create List    Star Trek    Star Wars    Perry Rhodan
    :FOR    ${ELEMENT}    IN    @{ITEMS}
    \    Log    ${ELEMENT}
    \    ${ELEMENT}    Replace String    ${ELEMENT}    ${SPACE}    ${EMPTY}
    \    Log    ${ELEMENT}

For-Loop-Exiting
    @{ITEMS}    Create List    Good Element 1    Break On Me    Good Element 2
    :FOR    ${ELEMENT}    IN    @{ITEMS}
    \    Log    ${ELEMENT}
    \    Run Keyword If    '${ELEMENT}' == 'Break On Me'    Exit For Loop
    \    Log    Do more actions here ...

Set Calendar Date
    [Arguments]  ${fdate}
    ${mydate}  Convert To Calendar Date  ${fdate}
    log to console  ${mydate}
    Find Calendar Month   ${mydate}
    sleep  2s
    AppiumLibrary.wait until element is visible  xpath=//android.view.View[contains(@content-desc,'${mydate}')]
    AppiumLibrary.click element  xpath=//android.view.View[contains(@content-desc,'${mydate}')]
    get screenshot
    AppiumLibrary.click element  id=button1
Set Transfers Older device Calendar Date
    [Arguments]  ${fdate}
    ${mydate}  Convert To Calendar Date  ${fdate}
    Find Calendar Future Date   ${mydate}
   # wait until element is visible  id=date_picker_year
    AppiumLibrary.click element  xpath=//android.view.View[contains(@content-desc,'${mydate}')]
    get screenshot
    AppiumLibrary.click element  id=button1

Set BillPay Older device Calendar Date
    [Arguments]  ${fdate}
    ${mydate}  Convert To Calendar Date  ${fdate}
    Find Calendar Future Date   ${mydate}
   # wait until element is visible  id=date_picker_year
    AppiumLibrary.click element  xpath=//android.view.View[contains(@content-desc,'${mydate}')]
    get screenshot
    AppiumLibrary.click element  id=button1

Set Transfers Calendar Date
    [Arguments]  ${fdate}
    ${mydate}  Convert To Calendar Date  ${fdate}
    find transfer calendar month   ${mydate}
   # wait until element is visible  id=date_picker_year
    AppiumLibrary.click element  xpath=//android.view.View[contains(@content-desc,'${mydate}')]
    get screenshot
    AppiumLibrary.click element  id=button1

Set Past Calendar Date
    [Arguments]  ${mydate}
     ${F_Date} =  Convert To Calendar Date    ${mydate}
     log to console  ${F_Date}
     log   calendar visible
      scroll up to view  //*[contains(@content-desc,'${F_Date}')]
      AppiumLibrary.click element  //*[contains(@content-desc,'${F_Date}')]
      AppiumLibrary.click element   button1

Set Future Calendar Date
    [Arguments]  ${mydate}
     ${F_Date} =  Convert To Calendar Date    ${mydate}
     log to console  ${F_Date}
     log   calendar visible
      Scroll Down To View  //*[contains(@content-desc,'${F_Date}')]
      AppiumLibrary.click element  //*[contains(@content-desc,'${F_Date}')]
      AppiumLibrary.click element   button1

Set Tablet Past Calendar Date
    [Arguments]  ${mydate}
     AppiumLibrary.wait until element is visible  id=date_picker_header_year
     ${F_Date} =  Convert To Calendar Date    ${mydate}
     log   calendar visible
    : FOR    ${INDEX}    IN RANGE    1    20
       \  ${present}  run keyword and return status      AppiumLibrary.page should contain element     xpath=//android.view.View[contains(@content-desc,'${F_Date}')]
       \  run keyword if  ${present}  Exit For Loop   ELSE    AppiumLibrary.click element   id=android:id/prev
    AppiumLibrary.click element     xpath=//*[contains(@content-desc,'${F_Date}')]
    get screenshot
    AppiumLibrary.click element  xpath=//*[contains(@resource-id,'button1')]

Set Tablet Future Calendar Date
    [Arguments]  ${mydate}
     AppiumLibrary.wait until element is visible  id=date_picker_header_year
     ${F_Date} =  Convert To Calendar Date    ${mydate}
     log   calendar visible
    : FOR    ${INDEX}    IN RANGE    1    20
       \  ${present}  run keyword and return status      AppiumLibrary.page should contain element     xpath=//android.view.View[contains(@content-desc,'${F_Date}')]
       \  run keyword if  ${present}  Exit For Loop   ELSE    AppiumLibrary.click element   id=android:id/next
    AppiumLibrary.click element     xpath=//*[contains(@content-desc,'${F_Date}')]
    get screenshot
    AppiumLibrary.click element  xpath=//*[contains(@resource-id,'button1')]
Find Calendar Future Date
    [Arguments]  ${mydate}
    AppiumLibrary.wait until element is visible  id=button1
    : FOR    ${INDEX}    IN RANGE    1    20
       \  ${present}  run keyword and return status      AppiumLibrary.page should contain element     xpath=//android.view.View[contains(@content-desc,'${mydate}')]
       \  run keyword if  ${present}  Exit For Loop   ELSE    dynamic swip up  id=animator
       \  sleep   2s
Find Calendar Month
    [Arguments]  ${mydate}
    AppiumLibrary.wait until element is visible  id=button1

    : FOR    ${INDEX}    IN RANGE    1    20
       \  ${present}  run keyword and return status      AppiumLibrary.page should contain element     xpath=//android.view.View[contains(@content-desc,'${mydate}')]
       \  run keyword if  ${present}  Exit For Loop   ELSE    swipe element down
       \  sleep   2s
Find Transfer Calendar Month
    [Arguments]  ${mydate}
    AppiumLibrary.wait until element is visible  id=button1

    : FOR    ${INDEX}    IN RANGE    1    20
       \  ${present}  run keyword and return status      AppiumLibrary.page should contain element     xpath=//android.view.View[contains(@content-desc,'${mydate}')]
       \  run keyword if  ${present}  Exit For Loop   ELSE     Dynamic Swip Up   animator
Find Calendar Year Older Devices
    [Arguments]  ${mydate}
    AppiumLibrary.wait until element is visible  id=animator
    AppiumLibrary.click element  id=button1
    ${YEAR}   get date year   ${mydate}
    #AppiumLibrary.scroll   //android.widget.TextView[contains(@index,'0')]   //android.widget.TextView[contains(@index,'6')]  #//android.widget.TextView[contains(@text,'${YEAR}')]  #//android.widget.TextView[contains(@text,'${YEAR}')]
    scroll up to view  //android.widget.TextView[contains(@text,'${YEAR}')]
    AppiumLibrary.click element   //android.widget.TextView[contains(@text,'${YEAR}')]
Find Calendar Year
    [Arguments]  ${mydate}
    AppiumLibrary.wait until element is visible  id=animator
    AppiumLibrary.click element  id=date_picker_header_year
    ${YEAR}   get date year   ${mydate}
    #AppiumLibrary.scroll   //android.widget.TextView[contains(@index,'0')]   //android.widget.TextView[contains(@index,'6')]  #//android.widget.TextView[contains(@text,'${YEAR}')]  #//android.widget.TextView[contains(@text,'${YEAR}')]
    scroll up to view  //android.widget.TextView[contains(@text,'${YEAR}')]
    AppiumLibrary.click element   //android.widget.TextView[contains(@text,'${YEAR}')]
Find Tablet Calendar Year
    [Arguments]  ${mydate}
    AppiumLibrary.wait until element is visible  id=date_picker_header_year
    AppiumLibrary.click element  id=date_picker_header_year
    ${YEAR}   get date year   ${mydate}
    Tablet Scroll Up To View  //android.widget.TextView[contains(@text,'${YEAR}')]
    AppiumLibrary.click element   //android.widget.TextView[contains(@text,'${YEAR}')]


Get Date Year
    [Arguments]  ${DATE}
    ${y}    Convert Date   ${DATE}  result_format=%Y
    [return]   ${y}

Swipe Element Up
    AppiumLibrary.swipe  1000  614  0  100  500
Dynamic Swip Up
  [Arguments]  ${locator}

   &{loc}  Get Element Area  ${locator}   #animator
   log to console  &{loc}[end_x]
    AppiumLibrary.swipe  &{loc}[end_x]  &{loc}[end_y]  &{loc}[start_x]   &{loc}[start_y]  1000
Dynamic Swip Down
    [Arguments]  ${locator}
   &{loc}  Get Element Area  ${locator}   #animator
   AppiumLibrary.swipe  &{loc}[start_x]  &{loc}[start_y]  0  &{loc}[end_y]  1000
Dynamic Swip Left
    [Arguments]  ${locator}
    &{loc}  Get Element Area  ${locator}   #animator
    AppiumLibrary.swipe  &{loc}[start_x]  &{loc}[start_y]  &{loc}[end_x]  &{loc}[start_y]  1000

Swipe Element Down
    AppiumLibrary.swipe  216  926  0  1400  1000  #537
Swipe Tablet Element Down
    AppiumLibrary.swipe  1511   607   0  932  2000

Swipe Element Left
    AppiumLibrary.swipe  1000  614  100  614  2000
    sleep  3s
Swipe Element Right
    AppiumLibrary.swipe  1000  614  100  614  2000
    sleep  3s

Get Month Name
    [Arguments]  ${MONTH}
    ${MONTHNAME}=  set variable   {'01':'January','02':'Februrary','03':'March','04':'April','05':'May','06':'June','07':'July','08':'August','09':'September','10':'October','11':'November','12':'December'}
     ${month}=   Evaluate   ${MONTHNAME}['${MONTH}']
     [Return]  ${month}
Convert To Calendar Date
    [Arguments]  ${DATE}
    ${d}    Convert Date   ${DATE}  result_format=%d
    ${m}    Convert Date   ${DATE}  result_format=%m
    ${y}    Convert Date   ${DATE}  result_format=%Y
    ${Month_Name}   Get Month Name  ${m}
    [Return]  ${d} ${Month_Name} ${y}
Convert Date To DMY Format
    [Arguments]  ${DATE}
    ${toformatdate}    Convert Date    ${DATE}     datetime

    ${test}   Convert To String   ${toformatdate.day}
    log to console    ${test}
    ${d}=    Convert To String    ${toformatdate.day}
    ${m}=    Convert To String    ${toformatdate.month}
    ${y}=    Convert To String    ${toformatdate.year}
    [Return]   ${m}/${d}/${y}
Get Screenshot
    AppiumLibrary.capture page screenshot   filename=${TEST_NAME}
Select Credit Card Account
     [Arguments]   ${cc_account}
     scroll element down to view    xpath=//*[contains(@text,'Credit Cards')]
     AppiumLibrary.click element     xpath=//*[contains(@text,'Credit Cards')]/../android.widget.ImageView
     scroll element down to view    xpath=//*[contains(@text,'${cc_account}')]
     Get Screenshot
     log  User collpases the Drop Down for Credit Cards
     AppiumLibrary.click element     xpath=//*[contains(@text,'${cc_account}')]
     AppiumLibrary.wait until element is visible   xpath=//*[contains(@text,'I WANT TO …')]
     Get Screenshot

Set Up Test
    run keyword if test failed    Get Screenshot

Validate Text
    [Arguments]  ${message}
    #AppiumLibrary.wait until element is visible   id=message
    AppiumLibrary.wait until page contains    ${message}
    AppiumLibrary.Capture Page Screenshot

Validate Message Error
    [Arguments]  ${message}
    #AppiumLibrary.wait until element is visible   id=message
    AppiumLibrary.wait until page contains    ${message}
    AppiumLibrary.Capture Page Screenshot

Select Between My Accounts
    [Arguments]  ${account1}  ${account2}
     AppiumLibrary.page should contain element     xpath=//*[contains(@resource-id,'id/carousel_accounts_from')]
    : FOR    ${INDEX}    IN RANGE    1    5
      \  ${PRESENT}   run keyword and return status      AppiumLibrary.page should contain element     xpath=//*[contains(@resource-id,'id/carousel_accounts_from')]//android.widget.TextView[contains(@text,'${account1}')]
      \   run keyword if   ${PRESENT}  exit for loop   ELSE   AppiumLibrary.swipe  1000  614  100  614  2000
    log to console  ${account2}
    : FOR    ${INDEX}    IN RANGE    1    5
      \  ${PRESENT}   run keyword and return status      AppiumLibrary.page should contain element     xpath=//*[contains(@resource-id,'id/carousel_accounts_to')]//android.widget.TextView[contains(@text,'${account2}')]
      \   run keyword if   ${PRESENT}  exit for loop   ELSE   AppiumLibrary.swipe  1000  1200  100  1200  2000

Get Element Area
    [Arguments]  ${element_locator}
    ${LOCATION}      AppiumLibrary.get element location    ${element_locator}

    ${SIZE}    AppiumLibrary.get element size   ${element_locator}

    ${x}   get from dictionary    ${LOCATION}    x
    ${y}   get from dictionary    ${LOCATION}    y
    ${x}  convert to integer  ${x}
    ${y}  convert to integer  ${y}
    ${WIDTH}    get from dictionary   ${SIZE}     width
    ${HEIGHT}   get from dictionary   ${SIZE}    height
    ${WIDTH}  convert to integer  ${WIDTH}
    ${HEIGHT}  convert to integer  ${HEIGHT}
    ${START_X}  set variable  ${x}
    ${START_Y}  set variable  ${y}
    ${end_X}  Evaluate     ${x}+${WIDTH}
    ${end_Y}  Evaluate    ${y}+${HEIGHT}
    &{dict}   Create Dictionary   start_x=${x}   start_y=${y}   end_x=${end_x}   end_y=${end_y}
    #AppiumLibrary.swipe  ${x}  ${y}  0  ${END_Y}  1000
    [Return]  &{dict}

Get Login Dynamic Text
    [Arguments]  ${element_locator}
    ${random_ques}     get text  ${element_locator}
    ${answer}   split with space  ${random_ques}
    [Return]  ${answer}



