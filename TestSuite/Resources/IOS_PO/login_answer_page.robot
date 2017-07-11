*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Resource       ../common.robot
Resource      ../Shared_Keywords.robot
*** Variables ***
${SCREENSHOTS}     ../IOS_Results${/}filename=${PREV_TEST_NAME}-{index}.png
${counter} =  1

*** Keywords ***
Add Login Answer
    [Arguments]   ${answer}
    AppiumLibrary.wait until element is visible    This is a device I use frequently. Remember it.
    Shared_Keywords.Get Screenshot
    AppiumLibrary.input text    answer_field   ${answer}
    AppiumLibrary.click element   santander_logo
Click On Continue Button
     common.scroll down to view   continue_btn
     AppiumLibrary.click element   continue_btn

Check Device Use Frequently
    AppiumLibrary.click element    //XCUIElementTypeStaticText["wdName==This is a device I use frequently. Remember it."]/preceding-sibling::XCUIElementTypeButton[1]

Check Don't Device Use Frequently
    AppiumLibrary.click element    //XCUIElementTypeStaticText["wdName==This is a device I don´t use frequently. Do not remember it."]/preceding-sibling::XCUIElementTypeButton[1]


Click On Forget Password
    @{ELEMENTS}  AppiumLibrary.get webelements   //XCUIElementTypeButton["wdName==forgotPwd_btn"]
     AppiumLibrary.click element  @{ELEMENTS}[3]
Click To Go Back
    AppiumLibrary.click element         //XCUIElementTypeNavigationBar[wdName="Login_ValidateChallenge_WrapperView"]/XCUIElementTypeButton[1]
Click Menu Button
     AppiumLibrary.click element         //XCUIElementTypeNavigationBar[wdName="Login_ValidateChallenge_WrapperView"]/XCUIElementTypeButton[2]


