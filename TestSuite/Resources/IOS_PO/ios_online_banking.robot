*** Settings ***

Library          AppiumLibrary
Resource        ../IOS_PO/ios_main_menu.robot
*** Variables ***


*** Keywords ***
Validate Page
    set appium timeout  30 seconds
    [Tags]  Online banking
    ios_main_menu.go to online banking service agreement
