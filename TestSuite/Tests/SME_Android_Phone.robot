*** Settings ***
Library          AppiumLibrary
Resource         ../Resources/Android_PO/login_SME.robot

Documentation   Android Phone Report
Test Setup  Open_Nexus_5X
Test Teardown   close application

*** Test Cases ***

Login and Logout with correct UserID and Password
    [Tags]  Login   Login_Positive
    Login and Logout SME app   f77ckj2     f77ctest12      1234abcd


