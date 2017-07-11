*** Settings ***
Library        AppiumLibrary     run_on_failure=Get Screenshot
#Library        ExcelLibrary
Resource       ../Shared_Keywords.robot

*** Keywords ***
Launch Menu
    AppiumLibrary.click element   id=action_menu
    AppiumLibrary.wait until element is visible    //android.widget.LinearLayout[contains(@content-desc,'transfer_btn')]
   Get Screenshot
Go To Transfer Funds
    Launch Menu
    AppiumLibrary.click element   //android.widget.LinearLayout[contains(@content-desc,'transfer_btn')]
    AppiumLibrary.wait until element is visible   //android.widget.RelativeLayout[contains(@content-desc,'between_my_account_subbtn')]
    Get Screenshot
Go To Transfer Between my accounts
    Go To Transfer Funds
    AppiumLibrary.click element   //android.widget.RelativeLayout[contains(@content-desc,'between_my_account_subbtn')]
    AppiumLibrary.wait until element is visible  id=et_amount
    Get Screenshot
Go To Transfer To someone else
    Go To Transfer Funds
    AppiumLibrary.click element   //android.widget.RelativeLayout[contains(@content-desc,'to_someone_else_subbtn')]
    AppiumLibrary.wait until element is visible  id=et_amount
    Get Screenshot

Go To Bill Pay
    Launch Menu
    AppiumLibrary.click element    //android.widget.LinearLayout[contains(@content-desc,'billpay_btn')]
    AppiumLibrary.wait until element is visible     //android.widget.RelativeLayout[contains(@content-desc,'single_payment_subbtn')]
    Get Screenshot
Go To Single payment
    Go To Bill Pay
    AppiumLibrary.click element  //android.widget.RelativeLayout[contains(@content-desc,'single_payment_subbtn')]
    AppiumLibrary.wait until element is visible     id=et_amount
    Get Screenshot
Go To Unpaid ebills
    Go To Bill Pay
    AppiumLibrary.click element  //android.widget.RelativeLayout[contains(@content-desc,'unpaid_ebills_subbtn')]
    AppiumLibrary.wait until element is visible     id=tv_date
    Get Screenshot
Go To Outgoing payments
    Go To Bill Pay
    AppiumLibrary.click element  //android.widget.RelativeLayout[contains(@content-desc,'outgoing_payment_subbtn')]
    AppiumLibrary.wait until element is visible     id=tv_date
    Get Screenshot
Go To Settings
    Launch Menu
    AppiumLibrary.click element     //android.widget.LinearLayout[contains(@content-desc,'settings_btn')]
    AppiumLibrary.wait until element is visible     //android.widget.RelativeLayout[contains(@content-desc,'quick_balance_subbtn')]
    Get Screenshot
Go To Quick Balance
    Go To Settings
    AppiumLibrary.click element      //android.widget.RelativeLayout[contains(@content-desc,'quick_balance_subbtn')]
    AppiumLibrary.wait until element is visible     id=tv_instructions
    Get Screenshot

Go To Manage Cards
    Go To Settings
    AppiumLibrary.click element      //android.widget.RelativeLayout[contains(@content-desc,'manage_cards_subbtn')]
    AppiumLibrary.wait until element is visible     //*[contains(@text,'Freeze Card')]
    Get Screenshot
Go To My Profile
    Go To Settings
    AppiumLibrary.click element     //android.widget.RelativeLayout[contains(@content-desc,'my_profile_subbtn')]
    AppiumLibrary.wait until element is visible     //*[contains(@text,'Manage Contact Details')]
    Get Screenshot

Go To Locations
    Launch Menu
    AppiumLibrary.click element     //android.widget.LinearLayout[contains(@content-desc,'locations_btn')]
    AppiumLibrary.wait until element is visible     id=content
    Get Screenshot
Go To Contact Us
    Launch Menu
    AppiumLibrary.click element     //android.widget.LinearLayout[contains(@content-desc,'contact_us_btn')]
    AppiumLibrary.wait until element is visible     //*[contains(@text,'Customer Support')]
    Get Screenshot
Go TO Help
    Launch Menu
    AppiumLibrary.click element     //*[contains(@content-desc,'help_btn')]
    AppiumLibrary.wait until element is visible     //*[contains(@text,'Using the App')]
    Get Screenshot
Go To Terms of Use
    Launch Menu
    AppiumLibrary.click element     //*[contains(@content-desc,'terms_of_use_btn')]
    Scroll Element Down To View      //*[contains(@content-desc,'online_banking_subbtn')]
    Get Screenshot

Go To Online Banking Service Agreement
    Go To Terms of Use
    AppiumLibrary.click element  //*[contains(@content-desc,'online_banking_subbtn')]
    AppiumLibrary.wait until element is visible    id=android:id/content
    #AppiumLibrary.wait until element is visible  id=com.google.android.apps.docs:id/pdf_view
    log   check screen shots for validation
    Get Screenshot
Go To Privacy Policy
    Go To Terms of Use
    Scroll Element Down To View  //*[contains(@content-desc,'privacy_policy_subbtn')]
    AppiumLibrary.click element     //*[contains(@content-desc,'privacy_policy_subbtn')]
    AppiumLibrary.wait until element is visible    id=android:id/content      #id=com.sec.android.app.sbrowser:id/sbrowser_content_view_holder
    log   check screen shots for validation
    Get Screenshot
Go To Sub Terms of Use
    set appium timeout  40 seconds
    Go To Terms of Use
    Scroll Element Down To View    //*[contains(@content-desc,'terms_of_use_subbtn')]
    AppiumLibrary.click element      //*[contains(@content-desc,'terms_of_use_subbtn')]
  #//*[contains(@text,'Privacy Policy')]/../following-sibling::android.widget.RelativeLayout
    AppiumLibrary.wait until element is visible    id=android:id/content
    #AppiumLibrary.wait until element is visible   Terms and Conditions
    Get Screenshot
Go To Statements And Documents
    Launch Menu
    AppiumLibrary.click element     //*[contains(@content-desc,'statements_btn')]
    Scroll Element Down To View      xpath=//*[contains(@content-desc,'view_statements_subbtn')]
    Get Screenshot
Go To View Statements
    Go To Statements And Documents
    AppiumLibrary.click element     xpath=//*[contains(@content-desc,'view_statements_subbtn')]
    AppiumLibrary.wait until element is visible    id=bt_filter
    Get Screenshot
Go To Tablet View Statements
    Go To Statements And Documents
    AppiumLibrary.click element     xpath=//*[contains(@content-desc,'view_statements_subbtn')]
    AppiumLibrary.wait until element is visible    id=bt_apply
    Get Screenshot
Go To Go Paperless
    Go To Statements And Documents
    Scroll Element Down To View     //android.widget.RelativeLayout[contains(@content-desc,'go_paperless_subbtn')]
    AppiumLibrary.wait until element is visible    //android.widget.RelativeLayout[contains(@content-desc,'go_paperless_subbtn')]
    AppiumLibrary.click element     //android.widget.RelativeLayout[contains(@content-desc,'go_paperless_subbtn')]
    AppiumLibrary.wait until element is visible   //*[contains(@text,'Select Accounts To Go Paperless')]
    Get Screenshot
Go To Logoff
     Launch Menu
     Scroll Element Down To View      //*[contains(@content-desc,'logoff_btn')]
     AppiumLibrary.click element        //*[contains(@content-desc,'logoff_btn')]
     AppiumLibrary.wait until element is visible    xpath=//*[contains(@text,'Are you sure you want to log off?')]
     Get Screenshot

