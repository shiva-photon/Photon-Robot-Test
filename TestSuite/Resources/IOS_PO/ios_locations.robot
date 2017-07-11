*** Settings ***
Library        AppiumLibrary
#Library        ExcelLibrary
Library        robot.libraries.String
Resource        ../common.robot
Resource        ../IOS_PO/ios_main_menu.robot

*** Variables ***


*** Keywords ***
Search for a Location
    set appium timeout  30 seconds
     [Documentation]  Go to location from main menu and search for a zipcode and validate results
    ios_main_menu.Go To Locations
    AppiumLibrary.input text    name=search_field     02124
    ${present}      run keyword and return status       AppiumLibrary.page should contain element        accessibility_id=Return
    #run keyword if   ${present}     AppiumLibrary.click element      accessibility_id=Return
    AppiumLibrary.click element     name=Boston, MA 02124, United States
    sleep  1s
    AppiumLibrary.wait until element is visible    name=CVS, 715 Morrissey Boulevard
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element    location_list_btn
    AppiumLibrary.wait until element is visible    CVS
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element   CVS
    AppiumLibrary.wait until element is visible  name=by car
    AppiumLibrary.page should contain element  name=by car
    AppiumLibrary.page should contain element  name=by walk
    AppiumLibrary.capture page screenshot