*** Settings ***
Library         AppiumLibrary      # run_on_failure=AppiumLibrary.Capture Page Screenshot
Library         Selenium2Library
Library         DateTime
#Library        ExcelLibrary
Resource       ../Shared_Keywords.robot
Resource       ../Android_PO/login.robot

*** Keywords ***

Tablet Incorrect UserID
    [Arguments]  ${temp_user}      ${date_of_birth}
    [Documentation]  The purpose of this test is to validate the error message by entering the right user id and wrong dob to reset password
     set appium timeout  30 seconds
     Only Add User Id text  hhhhhhhhhh
     go to forgot password screen
     Add Tablet Reset Info  ${temp_user}      ${date_of_birth}
     Shared_Keywords.Validate Message Error    User ID does not match with our records. Please try again.
Incorrect UserID
    [Arguments]  ${temp_user}      ${date_of_birth}
    [Documentation]  The purpose of this test is to validate the error message by entering the right user id and wrong dob to reset password
     set appium timeout  30 seconds
     Only Add User Id text  hhhhhhhhhh
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
    Shared_Keywords.Validate Message Error   You have entered an invalid New Password. New Password field must be between 6 and 12 digits and must contain at least one letter and one number. Please try again.
new pw is more than 12 alphanumeric digits
   [Arguments]   ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}  ${old_password}  ${new_password}
    [Documentation]  The purpose of this test is to validate the error message by entering the right user id and  dob but leave password empty reset password
    set appium timeout  30 seconds
    Go To Password Input Screen  ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}
    Add New Passwords    ${old_password}   ${new_password}
    Shared_Keywords.Validate Message Error   You have entered an invalid New Password. New Password field must be between 6 and 12 digits and must contain at least one letter and one number. Please try again.
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
    AppiumLibrary.page should contain text  Your password have been changed
    AppiumLibrary.click element  bt_continue
    login_app  ${temp_user}  ${answer}  ${new_password}
Go To Forgot Password Screen
     AppiumLibrary.wait until element is visible  id=et_user_id
     #AppiumLibrary.Capture Page Screenshot
     AppiumLibrary.click element      id=bt_forgot_password
     AppiumLibrary.wait until page contains   Date of Birth
     get screenshot

Add User Id And DOB
     [Arguments]   ${temp_user}  ${date_of_birth}
#     AppiumLibrary.input text         id=et_user_id       ${temp_user}
#     AppiumLibrary.hide keyboard
  #   AppiumLibrary.click element         id=et_birth_date
     #Find Calendar Year Older Devices    ${date_of_birth}
     #Set Past Calendar Date  ${date_of_birth}
     click object down  id=et_birth_date
     ${F_Date} =  Convert To Calendar Date    20171001
     #scroll_up_to_find_element  animator  //*[contains(@content-desc,'${F_Date}')]
     scroll down to find element  animator  //*[contains(@content-desc,'${F_Date}')]
     AppiumLibrary.click element  //*[contains(@content-desc,'${F_Date}')]
     AppiumLibrary.click element   button1
     #set future calendar date   20170701
     AppiumLibrary.element should be enabled  id=bt_continue
     log     continue button is enabled
     get screenshot
     AppiumLibrary.click element      id=bt_continue
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
    AppiumLibrary.Wait Until Element Is Visible    et_answer
    AppiumLibrary.input text  et_answer   ${answer}
    run keyword and ignore error    AppiumLibrary.hide keyboard
    get screenshot
    AppiumLibrary.click element  bt_continue

Add Invalid Password
     [Arguments]   ${password1}  ${password2}
     AppiumLibrary.Wait Until Element Is Visible   id=et_password
     AppiumLibrary.input text         id=et_password       ${password1}
     AppiumLibrary.hide keyboard
     AppiumLibrary.input text     et_verify_password      ${password2}
     AppiumLibrary.hide keyboard
     get screenshot
     AppiumLibrary.element should be disabled  bt_continue
Add New Passwords
     [Arguments]   ${password1}  ${password2}
     AppiumLibrary.Wait Until Element Is Visible   id=et_password
     AppiumLibrary.input text         id=et_password       ${password1}
     AppiumLibrary.hide keyboard
     AppiumLibrary.input text     et_verify_password      ${password2}
     AppiumLibrary.hide keyboard
     get screenshot
     AppiumLibrary.element should be enabled  bt_continue
     AppiumLibrary.click element  bt_continue
Go To Password Input Screen
    [Arguments]  ${temp_user}  ${date_of_birth}  ${answer}  ${account}  ${pin}
    Go To Forgot Password Screen
    Add User Id And DOB  ${temp_user}  ${date_of_birth}
#    Add Answer Question  ${answer}
#    AppiumLibrary.wait until page contains  Last 4 digits of your Santander Debit or Credit Card Number
#    Enter Account And Pin  ${account}  ${pin}

Enter Account And Pin
    [Arguments]  ${account1}   ${pin}
    AppiumLibrary.input text   et_card_number   ${account1}
    AppiumLibrary.hide keyboard
    AppiumLibrary.input text   et_pin   ${pin}
    AppiumLibrary.hide keyboard
    AppiumLibrary.click element   bt_continue



