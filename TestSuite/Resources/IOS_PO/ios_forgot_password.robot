*** Settings ***
Library         AppiumLibrary      # run_on_failure=AppiumLibrary.Capture Page Screenshot
Library         Selenium2Library
Library         DateTime
#Library        ExcelLibrary
Resource       ../Shared_Keywords.robot
Resource       ../IOS_PO/ios_login.robot

*** Keywords ***

Tablet Incorrect UserID
    [Arguments]  ${temp_user}      ${date_of_birth}
    [Documentation]  The purpose of this test is to validate the error message by entering the right user id and wrong dob to reset password
     set appium timeout  30 seconds
     go to forgot password screen
     Add Tablet Reset Info  ${temp_user}      ${date_of_birth}
     Shared_Keywords.Validate Message Error    User ID does not match with our records. Please try again.
Incorrect UserID
    [Arguments]  ${temp_user}      ${date_of_birth}
    [Documentation]  The purpose of this test is to validate the error message by entering the right user id and wrong dob to reset password
     set appium timeout  30 seconds
     go to forgot password screen
     Add User Id And DOB  ${temp_user}  ${date_of_birth}
     Shared_Keywords.Validate Message Error    User ID does not match with our records. Please try again.
New Password Is Empty
    [Arguments]   ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}  ${old_password}  ${new_password}
    [Documentation]  The purpose of this test is to validate the error message by entering the right user id and  dob but leave password empty reset password
    set appium timeout  30 seconds
    Go To Password Input Screen  ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}
    Add Invalid Password    ${old_password}   ${new_password}
    #Shared_Keywords.Validate Message Error   We did not recognize the Card Number you entered. Please try again.
new pw is just characters no digits
    [Arguments]   ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}  ${old_password}  ${new_password}
    [Documentation]  The purpose of this test is to validate the error message by entering the right user id and  dob but leave password empty reset password
    set appium timeout  30 seconds
    Go To Password Input Screen  ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}
    Add New Passwords    ${old_password}   ${new_password}
    Shared_Keywords.Validate Message Error   You have entered an invalid New Password. New Password field must be between 6 and 12 digits and must contain at least one letter and one number. Please try again.
new pw is just numeric digits
   [Arguments]   ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}  ${old_password}  ${new_password}
    [Documentation]  The purpose of this test is to validate the error message by entering the right user id and  dob but leave password empty reset password
    set appium timeout  30 seconds
    Go To Password Input Screen  ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}
    Add New Passwords    ${old_password}   ${new_password}
    Shared_Keywords.Validate Message Error   You have entered an invalid New Password. New Password field must be between 6 and 12 digits and must contain at least one lette

new pw is less than 6 alphanumeric characters
    [Arguments]   ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}  ${old_password}  ${new_password}
    [Documentation]  The purpose of this test is to validate the error message by entering the right user id and  dob but leave password empty reset password
    set appium timeout  30 seconds
    Go To Password Input Screen  ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}
    Add New Passwords    ${old_password}   ${new_password}
    AppiumLibrary.wait until element is visible   Warning
    Shared_Keywords.Validate Message Error   You have entered an invalid New Password. New Password field must be between 6 and 12 digits and must contain at least one letter and one number. Please, try again.
new pw is more than 12 alphanumeric digits
   [Arguments]   ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}  ${old_password}  ${new_password}
    [Documentation]  The purpose of this test is to validate the error message by entering the right user id and  dob but leave password empty reset password
    set appium timeout  30 seconds
    Go To Password Input Screen  ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}
    Add New Passwords    ${old_password}   ${new_password}
    AppiumLibrary.wait until element is visible   name=Your password has been changed
    get screenshot
    AppiumLibrary.click element    name=continue_btn
    AppiumLibrary.wait until element is visible    name=My Money
    get screenshot
new pw that not match
    [Arguments]   ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}  ${old_password}  ${new_password}
    [Documentation]  The purpose of this test is to validate the error message by entering the right user id and  dob but leave password empty reset password
    set appium timeout  30 seconds
    Go To Password Input Screen  ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}
    Add New Passwords    ${old_password}   ertyuigff1
    Shared_Keywords.Validate Message Error   Passwords do not match

Restore Password Successfully
    [Arguments]   ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}  ${old_password}  ${new_password}
    [Documentation]  The purpose of this test is to validate the error message by entering the right user id and  dob but leave password empty reset password
    set appium timeout  30 seconds
    Go To Password Input Screen  ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}
    Add New Passwords    ${old_password}  ${new_password}
    AppiumLibrary.wait until element is visible   name=Your password has been changed
    get screenshot
#    AppiumLibrary.click element    name=continue_btn
#    AppiumLibrary.wait until element is visible    name=My Money
#    get screenshot
Go To Forgot Password Screen
     AppiumLibrary.wait until element is visible    Enter your Online Banking User ID
     AppiumLibrary.click element      forgotPwd_btn

Add User Id And DOB
     [Arguments]   ${temp_user}  ${date_of_birth}
     AppiumLibrary.wait until element is visible  name=Date of birth
     AppiumLibrary.input text         name=user_id_field       ${temp_user}
     AppiumLibrary.click element      name=User ID
     AppiumLibrary.click element         //XCUIElementTypeTextField[2]/XCUIElementTypeButton
     set ios date picker    ${date_of_birth}
     #AppiumLibrary.hide keyboard   Done
     AppiumLibrary.click element      name=User ID
     AppiumLibrary.element should be enabled  Continue
#     log     continue button is enabled
#     get screenshot
     AppiumLibrary.click element      Continue
Add Tablet Reset Info
     [Arguments]   ${temp_user}  ${date_of_birth}
     AppiumLibrary.input text         id=et_user_id       ${temp_user}
     AppiumLibrary.hide keyboard
     AppiumLibrary.click element         id=et_birth_date
     Find Tablet Calendar Year    ${date_of_birth}
     Set Tablet Future Calendar Date  ${date_of_birth}
#     ${date}   Get Current Date     result_format=datetime
#     ${DOBM}       get date month   ${date_of_birth}
#     #${latermonth}   islaterthan  ${DOBM} ${date}
#     log to console  ${date}
#     log to console      ${DOBM}
     AppiumLibrary.element should be enabled  id=bt_continue
     log     continue button is enabled
     AppiumLibrary.Capture Page Screenshot
     AppiumLibrary.click element      id=bt_continue

Add Answer Question
    [Arguments]  ${answer}
    AppiumLibrary.Wait Until Element Is Visible    name=answer_field
    AppiumLibrary.input text  name=answer_field   ${answer}
    AppiumLibrary.click element  name=This is a device I use frequently. Remember it.
    AppiumLibrary.capture page screenshot
    AppiumLibrary.click element  name=continue_btn


Add Invalid Password
     [Arguments]   ${password1}  ${password2}
     AppiumLibrary.Wait Until Element Is Visible   name=password_field
     AppiumLibrary.input text         name=password_field       ${password1}
     AppiumLibrary.input text     name=password_field2      ${password2}
     get screenshot
     AppiumLibrary.element should be disabled  name=continue_btn
Add New Passwords
     [Arguments]   ${password1}  ${password2}
     AppiumLibrary.Wait Until Element Is Visible   name=password_field
     AppiumLibrary.input text         name=password_field       ${password1}
     AppiumLibrary.input text     name=password_field2      ${password2}
     get screenshot
     AppiumLibrary.element should be enabled  name=continue_btn
     AppiumLibrary.click element  name=continue_btn
Go To Password Input Screen
    [Arguments]  ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}
    Go To Forgot Password Screen
    Add User Id And DOB  ${temp_user}  ${date_of_birth}
    Add Answer Question  ${answer}
    AppiumLibrary.wait until page contains  Last 4 digits of your Santander Debit or Credit Card Number
    Enter Account And Pin  ${account}  ${pin}

Enter Account And Pin
    [Arguments]  ${account1}   ${pin}
    AppiumLibrary.input text   name=card_number   ${account1}
    AppiumLibrary.click element  name=Last 4 digits of your Santander Debit or Credit Card Number
    AppiumLibrary.input text   name=pin   ${pin}
   AppiumLibrary.click element  name=Last 4 digits of your Santander Debit or Credit Card Number
    AppiumLibrary.click element   name=continue_btn



