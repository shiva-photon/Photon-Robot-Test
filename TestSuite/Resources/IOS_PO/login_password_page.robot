*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Resource       ../common.robot
Resource       ../Shared_Keywords.robot
*** Variables ***
${SCREENSHOTS}     ../IOS_Results${/}filename=${PREV_TEST_NAME}-{index}.png
${counter} =  1

*** Keywords ***
Add Login Password
    [Arguments]   ${password}
    AppiumLibrary.wait until element is visible    Log On
    Shared_Keywords.Get Screenshot
    AppiumLibrary.input text   password_field   ${password}
    AppiumLibrary.click element  name=If your SSA personal security image and phrase are correct, enter your Online Banking Password

Click On Continue Button
     AppiumLibrary.wait until element is visible  name=Log_on_btn
     AppiumLibrary.click element   name=Log_on_btn

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


