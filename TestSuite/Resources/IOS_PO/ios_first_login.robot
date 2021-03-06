*** Settings ***
Library         AppiumLibrary      # run_on_failure=get screenshot
Library         ../../Lib/Listener.py
#Library        ExcelLibrary
Resource       ../Shared_Keywords.robot
Resource       ../common.robot

*** Keywords ***

Leave in the middle
    [Arguments]  ${temp_user}     ${temp_password}      ${account}      ${user_id}      ${password}
    [Documentation]  First time login with temp id and temp id from ROB portal and leave the process in the middle. a unique user id. requires own id.
     set appium timeout  30 seconds
     go to account authentication screen  ${temp_user}     ${temp_password}
     AppiumLibrary.click element    id=product_card_view
     #AppiumLibrary.click element    id=product_account_view
     Shared_Keywords.get screenshot
     AppiumLibrary.input text    id=et_product_identifier   ${account}
     AppiumLibrary.hide keyboard
     Shared_Keywords.get screenshot
     AppiumLibrary.click element      id=bt_continue
     AppiumLibrary.wait until element is visible    id=tv_step_description
     Page Should Contain Text         Set up your Login Info
    Shared_Keywords.get screenshot
#     AppiumLibrary.click element     id=action_help
#     AppiumLibrary.wait until element is visible   id=tv_text
#     log  Help Message is visible
#    Shared_Keywords.get screenshot
#     AppiumLibrary.click element        id=ib_close
     AppiumLibrary.input text         id=com.sovereign.santander.pre:id/et_user_id      ${user_id}
     AppiumLibrary.hide keyboard
     AppiumLibrary.input text         id=com.sovereign.santander.pre:id/et_verify_user_id    ${user_id}
     AppiumLibrary.hide keyboard
     AppiumLibrary.Page Should Contain Text         New User ID
     AppiumLibrary.Page Should Contain Text         Verify your New User ID
     AppiumLibrary.Page Should Contain Text         New Password
     AppiumLibrary.Page Should Contain Text         Verify your New Password
     AppiumLibrary.input text         id=com.sovereign.santander.pre:id/et_password     ${password}
     AppiumLibrary.hide keyboard
     AppiumLibrary.input text         id=et_verify_password        ${password}
     AppiumLibrary.hide keyboard
     Shared_Keywords.get screenshot
     AppiumLibrary.click element      id=bt_continue
     AppiumLibrary.wait until page contains       Your User ID and Password have been created
     Shared_Keywords.get screenshot
     AppiumLibrary.click element      id=bt_continue
     AppiumLibrary.wait until page contains     Electronic Communications Disclosure
     Shared_Keywords.get screenshot
     AppiumLibrary.click element   id=cb_accept
     Shared_Keywords.get screenshot
     AppiumLibrary.click element      id=bt_continue
     AppiumLibrary.wait until page contains     Online Banking Agreement
     Shared_Keywords.get screenshot
     AppiumLibrary.click element     id=cb_accept
     Shared_Keywords.get screenshot
     AppiumLibrary.element attribute should match    id=bt_continue      enabled     true
     AppiumLibrary.go back
     start activity   com.sovereign.santander.pre   com.santander.pruebas.SplashActivity
     sleep  3s
#     AppiumLibrary.click element      id=bt_continue
#     AppiumLibrary.wait until page contains     Select your Santander Secure Image
#     Log  Select your Santander Secure Image is Visible
#    Shared_Keywords.get screenshot
#     AppiumLibrary.Page Should Contain Text     Select Category
#     Log  Select Category is visible
#     AppiumLibrary.Page Should Contain Text     Select your Image
#     Log  Select your Image is visible
#     AppiumLibrary.Page Should Contain Text     Set up Profile Information
#     Log   Set up Profile Information is visible
#     AppiumLibrary.Page Should Contain Text     First Time Login
#     Log   First Time Login is visible
#     AppiumLibrary.Page Should Contain Text   Step 3/4
#     log  Phase 3 is visible
#     AppiumLibrary.click element      xpath=//android.support.v7.widget.RecyclerView/android.widget.LinearLayout
#    Shared_Keywords.get screenshot
#     Scroll Element Down To View    id=et_phrase
#     AppiumLibrary.input text    id=et_phrase      mobileretails
#     AppiumLibrary.hide keyboard
#     Scroll Element Down To View    et_challenge_1
#     AppiumLibrary.input text    et_challenge_1      test
#     AppiumLibrary.hide keyboard
#     Scroll Element Down To View    et_challenge_2
#     AppiumLibrary.input text    et_challenge_2      test
#     AppiumLibrary.hide keyboard
#     Scroll Element Down To View    et_challenge_3
#     AppiumLibrary.input text    et_challenge_3      test
#     AppiumLibrary.hide keyboard
#     Scroll Element Down To View       id=bt_continue
#     AppiumLibrary.click element      id=bt_continue
#     AppiumLibrary.Page Should Contain Text    Verify your Santander Secure Access Information
#     Scroll Element Down To View   id=bt_continue
#     AppiumLibrary.click element      id=bt_continue
#     AppiumLibrary.Close Application
#     AppiumLibrary.page should not contain text      Error

Edit SSA fields
    [Arguments]  ${user}   ${answer}    ${password}
    [Documentation]  Open Banking app
    set appium timeout  30 seconds
     AppiumLibrary.wait until element is visible  xpath=//*[contains(@resource-id,'et_user_id')]
     Shared_Keywords.get screenshot
     AppiumLibrary.input text  xpath=//*[contains(@resource-id,'et_user_id')]  ${user}
Incorrect Account number Error Message
    [Arguments]  ${temp_user}      ${temp_password}   ${account_numbers}
    [Documentation]  The purpose of this test is to validate the error message by entering the wrong account number for first time login users
     set appium timeout  30 seconds
     go to account authentication screen   ${temp_user}      ${temp_password}
     Add Account   ${account_numbers}
     Shared_Keywords.Validate Message Error    We did not recognize the Account Number you entered. Please try again.
Incorrect Debit Card number Error Message
    [Arguments]  ${temp_user}      ${temp_password}   ${account_numbers}
    [Documentation]  The purpose of this test is to validate the error message by entering the wrong account number for first time login users
    set appium timeout  30 seconds
    go to account authentication screen   ${temp_user}      ${temp_password}
    Add Account   ${account_numbers}
    Shared_Keywords.Validate Message Error   We did not recognize the Credit/Debit Card Number you entered. Please try again.
Incorrect Credit Card number Error Message
    [Arguments]  ${temp_user}      ${temp_password}   ${account_numbers}
    [Documentation]  The purpose of this test is to validate the error message by entering the wrong account number for first time login users
    set appium timeout  30 seconds
    go to account authentication screen   ${temp_user}      ${temp_password}
    Add Account   ${account_numbers}
    Shared_Keywords.Validate Message Error  We did not recognize the Credit/Debit Card Number you entered. Please try again.
New Password Negative
    [Arguments]  ${temp_user}      ${temp_password}   ${account_numbers}  ${user_id}    ${user_password}
    [Documentation]  Open Banking app
    set appium timeout  30 seconds
    go to set up login info  ${temp_user}      ${temp_password}   ${account_numbers}  ${user_id}    ${user_password}
    Add Password   ${user_id}    ${user_id}       ${user_password}      ${user_password}12
    #AppiumLibrary.click element   name=continue_btn
    Shared_Keywords.Validate Message Error    You have entered different passwords. Please try again

Incorrect Account number
    [Arguments]  ${temp_user}      ${temp_password}   ${account_numbers}
    [Documentation]  The purpose of this test is to validate the error message by entering the wrong account number for first time login users
    set appium timeout  30 seconds
    go to account authentication screen   ${temp_user}      ${temp_password}
    Add Account   ${account_numbers}
    Shared_Keywords.Validate Message Error  We did not recognize the Account Number you entered. Please try again.
Incorrect UserId and PW
    [Arguments]  ${temp_user}     ${temp_password}    ${account_numbers}  ${user_id}    ${user_password}
    [Documentation]  Open Banking app
    go to set up login info  ${temp_user}      ${temp_password}   ${account_numbers}  ${user_id}    ${user_password}
    Add Password   ${user_id}    ${user_id}12       ${user_password}      ${user_password}12
    AppiumLibrary.click element   name=continue_btn
    Shared_Keywords.Validate Message Error   You have entered different User IDs. Please try again
New Password 12 Characters
    [Arguments]  ${temp_user}     ${temp_password}    ${account_numbers}  ${user_id}    ${user_password}
    set appium timeout  30 seconds
    run first login    ${temp_user}     ${temp_password}    ${account_numbers}  ${user_id}    ${user_password}

New Password 6 Characters
    [Arguments]  ${temp_user}     ${temp_password}    ${account_numbers}  ${user_id}    ${user_password}
    set appium timeout  30 seconds
    run first login    ${temp_user}     ${temp_password}    ${account_numbers}  ${user_id}    ${user_password}

No Paperless accounts selected
    [Arguments]  ${temp_user}     ${temp_password}    ${account_numbers}  ${user_id}    ${user_password}
    set appium timeout  30 seconds
    run first login   ${temp_user}     ${temp_password}    ${account_numbers}  ${user_id}    ${user_password}
Switch between Rob mobile and Desktop
    [Arguments]  ${user}   ${answer}    ${password}
    set appium timeout  30 seconds
     AppiumLibrary.wait until element is visible  xpath=//*[contains(@resource-id,'et_user_id')]
Go To Account Authentication Screen
    [Arguments]  ${temp_user}   ${temp_password}
     AppiumLibrary.wait until element is visible  name=user_id_field
     AppiumLibrary.input text      name=user_id_field       ${temp_user}
     Shared_Keywords.get screenshot
     AppiumLibrary.click element      name=continue_btn
     AppiumLibrary.wait until element is visible   name=Enter your Temporary Password
     AppiumLibrary.input text         name=password_field     ${temp_password}
     AppiumLibrary.click element  Enter your Temporary Password
     Shared_Keywords.get screenshot
     AppiumLibrary.click element      name=continue_btn
     AppiumLibrary.wait until element is visible     name=account_field
     AppiumLibrary.click element      name=continue_btn
     AppiumLibrary.Page Should Contain Text         Set up your Login Info
     #AppiumLibrary.Page Should Contain Text         Provide a valid Santander Bank Account Number or a Santander Debit or Credit Card Number.
     AppiumLibrary.Page Should Contain Text         Enter Account Number
     #AppiumLibrary.Page Should Contain Text         Checking, Savings, Money Market, Credit or Mortgage
     Shared_Keywords.get screenshot

Go To Set Up Login Info
    [Arguments]  ${temp_user}   ${temp_password}  ${account}  ${user_id}  ${password}
    set appium timeout  30 seconds
     go to account authentication screen   ${temp_user}   ${temp_password}
     Add Account   ${account}
     AppiumLibrary.wait until page contains      Set up your Login Info
    Shared_Keywords.get screenshot


Add Account
    [Arguments]  ${account}
    set appium timeout  30 seconds
    AppiumLibrary.click element   Enter Account Number
    ${Item_Lenght}    get length    ${account}
     run keyword if    ${Item_Lenght} > 11   input credit   ${account}     ELSE   Input Account    ${account}
     AppiumLibrary.click element      name=continue_btn

Add Password
    [Arguments]  ${user_id1}  ${user_id2}  ${password1}  ${password2}
     set appium timeout   30 seconds
     AppiumLibrary.wait until element is visible   name=user_id_field
     AppiumLibrary.clear text         name=user_id_field
     AppiumLibrary.input text         name=user_id_field      ${user_id1}
     AppiumLibrary.clear text         name=user_id_field2
     AppiumLibrary.input text         name=user_id_field2    ${user_id2}
     AppiumLibrary.click element      name=New User ID
     AppiumLibrary.Page Should Contain Text         New User ID
     AppiumLibrary.Page Should Contain Text         Verify New User ID
     AppiumLibrary.Page Should Contain Text         New Password
     AppiumLibrary.Page Should Contain Text         Verify New Password
     AppiumLibrary.clear text         name=password_field
     AppiumLibrary.input text         name=password_field     ${password1}
     AppiumLibrary.click element      New Password
     #run keyword and ignore error    hide keyboard
     AppiumLibrary.clear text         name=password_field2
     AppiumLibrary.input text         name=password_field2     ${password2}
     AppiumLibrary.click element     Verify New Password

     #run keyword and ignore error    hide keyboard
    AppiumLibrary.swipe   400  400  0  -200  1000
    AppiumLibrary.click element      name=continue_btn

Negative Set Login Info
     [Arguments]   ${user_id}  ${user_id1}   ${password}  ${password1}
     set appium timeout  30 seconds
     AppiumLibrary.input text         id=et_user_id      ${user_id}
     AppiumLibrary.hide keyboard
     AppiumLibrary.input text         id=et_verify_user_id    ${user_id1}
     AppiumLibrary.hide keyboard
     AppiumLibrary.Page Should Contain Text         New User ID
     AppiumLibrary.Page Should Contain Text         Verify your New User ID
     AppiumLibrary.Page Should Contain Text         New Password
     AppiumLibrary.Page Should Contain Text         Verify your New Password
     AppiumLibrary.input text         id=com.sovereign.santander.pre:id/et_password     ${password}
     AppiumLibrary.hide keyboard
     AppiumLibrary.input text         id=et_verify_password        ${password1}
     AppiumLibrary.hide keyboard
     Shared_Keywords.get screenshot
     AppiumLibrary.click element      id=bt_continue

Run First Login
    [Arguments]  ${temp_user}     ${temp_password}      ${account}      ${user_id}      ${password}
    [Documentation]  First time login with temp id and temp id from ROB portal and leave the process in the middle.
     set appium timeout  60 seconds
     #ios_first_login.Log In And Continue First Login     ${user_id}      ${password}
     go to set up login info   ${temp_user}     ${temp_password}      ${account}      ${user_id}      ${password}
#     AppiumLibrary.click element     help_btn
#     AppiumLibrary.wait until element is visible   help-ico-navbar
#     log  Help Message is visible
#    Shared_Keywords.get screenshot
#     AppiumLibrary.click element        close ico
#     sleep  2s

    Add Password     ${user_id}     ${user_id}     ${password}    ${password}
    Validate Customer Created
     Accept Electronic Disclosure
     Accept Online Banking Agreement
    # main
     Select Secure Image
     #Complete Challenge Questions
     AppiumLibrary.wait until element is visible   Verify your Santander Secure Access Information
     AppiumLibrary.capture page screenshot
      common.Swipe Element Up
      common.Swipe Element Up
     AppiumLibrary.click element   continue_btn
     AppiumLibrary.wait until element is visible    Verify your Contact Information
     AppiumLibrary.capture page screenshot
     common.Swipe Element Up
     AppiumLibrary.click element   Confirm
     AppiumLibrary.wait until element is visible      Select Accounts to Go Paperless
     AppiumLibrary.capture page screenshot
    AppiumLibrary.click element    confirm_btn
    AppiumLibrary.wait until element is visible    ok_btn
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  ok_btn
    AppiumLibrary.wait until element is visible    My Money
    AppiumLibrary.capture page screenshot
Select Secure Image
     AppiumLibrary.wait until element is visible     Select your Santander Secure Access image
     Log  Select your Santander Secure Image is Visible
    Shared_Keywords.get screenshot
     AppiumLibrary.page should contain element  refresh ico
     AppiumLibrary.Page Should Contain Text     Select your image
     common.Swipe Element Up
     Log  Select Category is visible
     AppiumLibrary.click element   select_image_container
     AppiumLibrary.Page Should Contain Text     First Time Login
     Log   First Time Login is visible
     AppiumLibrary.Page Should Contain Text   Step 3/4
     log  Phase 3 is visible
     AppiumLibrary.page should contain element    Select Your Phrase
     AppiumLibrary.clear text    phrase_txt
     AppiumLibrary.input text     phrase_txt    Mobile Retails
     common.Swipe Element Up
     AppiumLibrary.page should contain element   Select Challenge Questions
     AppiumLibrary.click element       select1_btn
     AppiumLibrary.click element   Select Challenge Questions
     AppiumLibrary.clear text    answer1_btn
     AppiumLibrary.input text    answer1_btn     test
     AppiumLibrary.go back
     common.Swipe Element Up
     AppiumLibrary.click element       select2_btn
     AppiumLibrary.clear text    answer2_btn
     AppiumLibrary.input text    answer2_btn     test
     common.Swipe Element Up
     AppiumLibrary.click element       select3_btn
     AppiumLibrary.clear text  answer3_btn
     AppiumLibrary.input text    answer3_btn     test
     AppiumLibrary.element should be enabled   continue_btn
     AppiumLibrary.click element   continue_btn


Complete Challenge Questions
    @{E}    AppiumLibrary.Get Webelements      id=rv_block
     AppiumLibrary.click element     @{E}[1]
    Shared_Keywords.get screenshot
     Scroll Element Down To View    id=et_phrase
     AppiumLibrary.input text    id=et_phrase      mobileretails
     AppiumLibrary.hide keyboard
     Scroll Element Down To View    et_challenge_1
     AppiumLibrary.input text    et_challenge_1      test
     AppiumLibrary.hide keyboard
     Scroll Element Down To View    et_challenge_2
     AppiumLibrary.input text    et_challenge_2      test
     AppiumLibrary.hide keyboard
     Scroll Element Down To View    et_challenge_3
     AppiumLibrary.input text    et_challenge_3      test
     AppiumLibrary.hide keyboard
     Scroll Element Down To View       id=bt_continue
     AppiumLibrary.click element      id=bt_continue

Select Go Paperless All_4
     AppiumLibrary.wait until page contains    Select Accounts To Go Paperless
    Shared_Keywords.get screenshot
     AppiumLibrary.click element      id=bt_continue
Enter User ID
    [Arguments]  ${user}
    AppiumLibrary.wait until element is visible  user_id_field
    Shared_Keywords.Get Screenshot
    AppiumLibrary.input text   user_id_field   ${user}
    AppiumLibrary.hide keyboard

Check Remember Me
    AppiumLibrary.click element    //XCUIElementTypeStaticText["wdName==Remember me"]/preceding-sibling::XCUIElementTypeButton[1]

Click On Continue Button
    AppiumLibrary.click element   continue_btn

Click On Forget Password
    @{ELEMENTS}  AppiumLibrary.get webelements   //XCUIElementTypeButton["wdName==forgotPwd_btn"]
     AppiumLibrary.click element  @{ELEMENTS}[3]
Input Account
    [Arguments]  ${account}
    AppiumLibrary.click element    name=account_btn
   Shared_Keywords.get screenshot
     AppiumLibrary.clear text   name=account_field
     AppiumLibrary.input text    name=account_field   ${account}
     AppiumLibrary.click element   Enter Account Number
    Shared_Keywords.get screenshot
Input Credit
    [Arguments]  ${account}
     AppiumLibrary.click element    name=debit_btn
    Shared_Keywords.get screenshot
     AppiumLibrary.clear text   name=credit_field
     AppiumLibrary.input text    name=credit_field   ${account}
     AppiumLibrary.click element   Enter Card Number
    Shared_Keywords.get screenshot
Accept Electronic Disclosure
    AppiumLibrary.wait until element is visible   Electronic Communications Disclosure
     AppiumLibrary.wait until page contains element       Terms and Conditions
     AppiumLibrary.wait until page contains element      Step 2/4
     AppiumLibrary.wait until page contains element     Progress
     AppiumLibrary.capture page screenshot
     AppiumLibrary.click element   agree_btn
     AppiumLibrary.click element      online_agreement_btn
Validate Customer Created
    AppiumLibrary.wait until element is visible    Your User ID and Password have been created
     AppiumLibrary.page should contain element    credentials-ico
     log  check mark is visible
     AppiumLibrary.click element      continue_btn
Accept Online Banking Agreement
    AppiumLibrary.wait until element is visible  Online Banking Agreement
    #AppiumLibrary.page should contain element     I have read and agree to the Online Banking Agreement
   # AppiumLibrary.page should contain element   view
    AppiumLibrary.capture page screenshot
     AppiumLibrary.click element      agree_btn
     AppiumLibrary.click element   continue_btn
Log In And Continue First Login
    [Arguments]  ${temp_user}  ${temp_password}
     AppiumLibrary.wait until element is visible    user_id_field
     AppiumLibrary.input text    user_id_field    ${temp_user}
     AppiumLibrary.click element  continue_btn
     AppiumLibrary.wait until element is visible    password_field
     AppiumLibrary.input text   password_field   ${temp_password}
     AppiumLibrary.click element  continue_btn