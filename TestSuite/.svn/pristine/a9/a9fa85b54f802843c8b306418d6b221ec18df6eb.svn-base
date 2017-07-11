*** Settings ***

Library          AppiumLibrary
Resource        ../IOS_PO/ios_main_menu.robot
*** Variables ***


*** Keywords ***
Contact Us Iphone
    set appium timeout  30 seconds
    [Tags]  My_Money_Account_Details
    ios_main_menu.go to contact us
    AppiumLibrary.wait until element is visible  name=Customer support
    page should contain text  1-877-768-2265
    page should contain text  7 Days per week from 6 a.m. to 10 p.m. ET
    page should contain text  Support for customers with hearing impairments
    page should contain text  1-800-428-9121 (TTY/TDD)
    page should contain text  7 Days per week from 6 a.m. to 10 p.m. ET
    page should contain text  Support for customers calling from outside the United States
    page should contain text  1-401-824-3400
    page should contain text  Lost or stolen debit card
    page should contain text  1-800-762-5895
    page should contain text    Lost or stolen debit card for customers calling from outside the United States
    page should contain text    1-401-432-0749
    AppiumLibrary.capture page screenshot