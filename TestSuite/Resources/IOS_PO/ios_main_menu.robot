*** Settings ***
Library        AppiumLibrary     run_on_failure=AppiumLibrary.Capture Page Screenshot
#Library        ExcelLibrary
Resource        ../common.robot

*** Keywords ***
Go To Main Menu
    AppiumLibrary.click element      name=menu_btn
    AppiumLibrary.wait until element is visible    name=transfer_btn
    AppiumLibrary.capture page screenshot
Go To Transfer Funds
    ios_main_menu.Go To Main Menu
    AppiumLibrary.click element     name=transfer_btn
    AppiumLibrary.wait until element is visible   name=Between my accounts
    AppiumLibrary.capture page screenshot
Go To Transfer Between my accounts
    ios_main_menu.Go To Transfer Funds
    AppiumLibrary.click element   name=Between my accounts
    AppiumLibrary.wait until element is visible  name=FROM ACCOUNT
    AppiumLibrary.capture page screenshot
Go To Transfer To someone else
    ios_main_menu.Go To Transfer Funds
    AppiumLibrary.click element   name=To Someone Else
    AppiumLibrary.wait until element is visible  from_account_carousell
    AppiumLibrary.capture page screenshot

Go To Bill Pay
    ios_main_menu.Go To Main Menu
    AppiumLibrary.click element      name=billpay_btn
    AppiumLibrary.wait until element is visible     name=Single Payment
    AppiumLibrary.capture page screenshot
Go To Single payment
    ios_main_menu.Go To Bill Pay
    AppiumLibrary.click element  name=Single Payment
    AppiumLibrary.wait until element is visible     name=add_user
    AppiumLibrary.capture page screenshot
Go To Unpaid ebills
    ios_main_menu.Go To Bill Pay
    AppiumLibrary.click element  name=Unpaid e-Bills
    AppiumLibrary.wait until element is visible     name=add_user
    AppiumLibrary.capture page screenshot
Go To Outgoing payments
    ios_main_menu.Go To Bill Pay
    AppiumLibrary.click element   name=Outgoing Payments
    AppiumLibrary.wait until element is visible     name=add_user
    AppiumLibrary.capture page screenshot
Go To Deposit Checks
    ios_main_menu.Go To Main Menu
    AppiumLibrary.click element    name=RDC_btn
    AppiumLibrary.wait until element is visible    name=Capture check
    AppiumLibrary.capture page screenshot
Go To Settings
    ios_main_menu.Go To Main Menu
    AppiumLibrary.click element     name=settings_btn
    AppiumLibrary.wait until element is visible     name=Quick Balance
    AppiumLibrary.capture page screenshot
Go To Quick Balance
    ios_main_menu.Go To Settings
    AppiumLibrary.click element     name=Quick Balance
    AppiumLibrary.wait until element is visible     //XCUIElementTypeNavigationBar["wdName==Quick Balance"]
    AppiumLibrary.capture page screenshot

Go To Manage Cards
    ios_main_menu.Go To Settings
    AppiumLibrary.click element     name=Manage Cards
    AppiumLibrary.wait until element is visible     //XCUIElementTypeNavigationBar["wdName==Manage Cards"]
    AppiumLibrary.capture page screenshot
Go To My Profile
    ios_main_menu.Go To Settings
    AppiumLibrary.click element     name=My Profile
    AppiumLibrary.wait until element is visible     //XCUIElementTypeNavigationBar["wdName==My Profile"]
    AppiumLibrary.capture page screenshot

Go To Locations
    ios_main_menu.Go To Main Menu
    AppiumLibrary.click element     name=locations_btn
    AppiumLibrary.wait until element is visible     name=Information
    AppiumLibrary.click element   name=Ok
    AppiumLibrary.capture page screenshot
Go To Contact Us
    ios_main_menu.Go To Main Menu
    AppiumLibrary.click element     contact_us_btn
    AppiumLibrary.wait until element is visible   name=Customer support
    AppiumLibrary.capture page screenshot

Go TO Help
    ios_main_menu.Go To Main Menu
    AppiumLibrary.click element     name=help_btn
    AppiumLibrary.wait until element is visible     //XCUIElementTypeNavigationBar["wdName==Help"]
    AppiumLibrary.capture page screenshot
Go To Terms of Use
    ios_main_menu.Go To Main Menu
    AppiumLibrary.click element     name=terms_of_use_btn
    common.Scroll Down To View      name=Terms of Use
    AppiumLibrary.capture page screenshot
Go To Online Banking Service Agreement
    ios_main_menu.Go To Terms of Use
    AppiumLibrary.click element  name=Online Banking Agreement
    sleep  3s
    AppiumLibrary.wait until element is visible     //XCUIElementTypeOther/XCUIElementTypeWebView
    log   check screen shots for validation
    AppiumLibrary.capture page screenshot
Go To Privacy Policy
    ios_main_menu.Go To Terms of Use
    AppiumLibrary.click element  name=Privacy Policy
    AppiumLibrary.wait until element is visible    name=Privacy Information

    log   check screen shots for validation
    AppiumLibrary.capture page screenshot
Go To Sub Terms of Use
    ios_main_menu.Go To Terms of Use
    AppiumLibrary.click element   name=Terms of Use
    AppiumLibrary.wait until element is visible    name=Terms and Conditions
    AppiumLibrary.capture page screenshot
Go To Statements And Documents
    ios_main_menu.Go To Main Menu
    AppiumLibrary.click element     name=statements_btn
    common.Scroll Down To View      name=View Statements
    AppiumLibrary.capture page screenshot
Go To View Statements
    ios_main_menu.Go To Statements And Documents
    AppiumLibrary.click element     name=View Statements
    AppiumLibrary.wait until element is visible    //XCUIElementTypeNavigationBar["wdName==Statements"]
    AppiumLibrary.capture page screenshot

Go To Go Paperless
    ios_main_menu.Go To Statements And Documents
    AppiumLibrary.click element    name=Go Paperless
    AppiumLibrary.wait until element is visible   //XCUIElementTypeNavigationBar["wdName==Go Paperless"]
    AppiumLibrary.capture page screenshot
Go To Log Off
    ios_main_menu.Go To Main Menu
    common.scroll down to view   name=logoff_btn
    AppiumLibrary.click element   name=logoff_btn
    AppiumLibrary.wait until page contains     Are you sure you want to log off?
    AppiumLibrary.capture page screenshot

