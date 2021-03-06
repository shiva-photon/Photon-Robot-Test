*** Settings ***
Library         ../Data/MyLibrary.py
Library         ../Data/Listener.py
Library           pabot.PabotLib
Resource         ../Resources/mobile_retail.robot
Library          AppiumLibrary     run_on_failure=get screenshot
Resource         ../Resources/common.robot
Resource         ../IOS_PO/ios_login.robot
Resource         ../IOS_PO/ios_first_login.robot
Resource         ../IOS_PO/ios_overview.robot
Resource         ../IOS_PO/ios_account_details.robot
Resource         ../IOS_PO/term_of_use.robot
Resource         ../IOS_PO/ios_credit_card.robot
Resource         ../IOS_PO/statements.robot
Resource         ../IOS_PO/bill_pay.robot
Resource         ../IOS_PO/quickbalance.robot
Resource        ../IOS_PO/ios_contact.robot
Resource        ../IOS_PO/ios_help.robot
Resource        ../IOS_PO/ios_locations.robot
Resource        ../IOS_PO/ios_online_banking.robot
Resource         ../IOS_PO/ios_forgot_password.robot
Resource         ../IOS_PO/ios_transfers.robot
#Suite Setup        Setup chromedriver
Test Setup         Open iPad Simulator    #common.Open iphone       #common.open ios simulator    #
Test Teardown      close application


*** Variables ***




#lcorobm64  test  sov12345

*** Test Cases ***
trial
   Login_into_ROB_2    Dddata7  test   sov12345
    #main
#    Login Phone Into Mobile Retails   Dddata7  test   sov12345
#    ios_main_menu.Go TO Help
    #Login Phone Into Mobile Retails   lcoben3  test   ben12345

#Test Case 1:
Login with Incorrect User Id
    [Tags]   Login
    ios_login.Incorrect User Id   edcvgh    gfdcghggf
Login With Incorrect Password
    [Tags]   Login
    ios_login.Incorrect Password  ccdata12   test   erertrtt
Login To Main Page
    [Tags]   Login
    Login Phone Into Mobile Retails   ccdata12   test  sov12345
Login And Block Account
    ios_login.Block User After 3 Times   dfgdfgd  dfgfdgg
Log Off
    [Tags]   Login
    Login Phone Into Mobile Retails   lcorobm64  test  1234abcd
    ios_login.Log Off

First Login Incorrect Account number Error Message
    [Tags]  first_login   first login negative  negative message
    Incorrect Account Number Error Message     997581349	san1231349     34595640

First Login Incorrect Debit Card number Error Message
    [Tags]  first_login  first login negative   negative message
   Incorrect Debit Card number Error Message   997581349	san1231349     40816566980934960

First Login Incorrect Credit Card number Error Message
    [Tags]  first_login  first login negative  negative message
    Incorrect Credit Card number Error Message   997581349	san1231349     40816566980914456

First Login Negative New Password
    [Tags]  First Login  first login negative
    New Password Negative     968981357     san1231357     5129920072044799        Testid8      sov12345

First Login Incorrect Account number
    [Tags]  First Login  first login negative
    Incorrect Account number   968981357     san1231357     40816566

First Login New incorrect UserId and PW and new PW doesnt match
    [Tags]  First Login  first login negative
    [Documentation]  This test requires a new temp login, password, account number and unique id
    Incorrect UserId and PW   968981357     san1231357     5129920072044799        Testid8      sov12345

First Login Edit SSA fields
    [Tags]  First Login  First Login Positive
    Edit SSA fields   lcoben6  test  sov12345

First Login New Password 12 Characters
    [Tags]  First Login  First Login Positive
    [Documentation]  This test requires a new temp login, password, account number and unique id
   New Password 12 Characters     995272106	 san1232106	  5129915133747794	lcoben161  sov12345


First Login New Password 6 Characters
    [Tags]  First Login  First Login Positive
    [Documentation]  This test requires a new temp login, password, account number and unique id
    New Password 6 Characters    995214202	san1234202	9111449748	lcoben160	sov12345

First Login No Paperless accounts selected
    [Tags]  First Login  First Login Positive
    No Paperless accounts selected   995151787	san1231787	9995119846	lcoben159	sov12345

First Login Switch between Rob mobile and Desktop
    [Tags]  First Login  First Login Positive
    #first_login.Switch between Rob mobile and Desktop   robhealthcheck  test  sov12345
    Login_App    ccdata2  test  sov12345

First Login User leaves the app in the middle on the procces
    [Tags]  First Login  First Login Positive
    Leave in the middle    995091555	san1231555	5129915133747794	lcoben158	sov12345

Account_Overview
      [Tags]  Account_Overview
      Login Phone Into Mobile Retails    robtest4  test  1234abcd
      ios_overview.Validate Overview Elements
      Select Account Number  *2927

#      close application

Overview_Account_Details
     [Tags]  Account_Overview
      Login Phone Into Mobile Retails    robtest4  test  1234abcd
      ios_account_details.Account Details   *2927
#     close application

Filtering_Option_All
      [Tags]  Account_Overview   Filters
      Login_App  robhealthcheck1   test   sov12345
      Filtering_Option_All   *3564   20170401   20170615

Filtering_Option_IN
     [Tags]  Account_Overview   Filters
     Login_App  robhealthcheck1   test   sov12345
     Filtering_Option_IN    *3564   20170401   20170615

Filtering_Option_OUT
     [Tags]  Account_Overview   Filters
     Login_App  robhealthcheck1   test   sov12345
     Filtering_Option_OUT   *3564   20170401   20170615

I_Want_To_options
    [Tags]  Account_Overview
    Login Phone Into Mobile Retails  lcorobm64   test  1234abcd
    ios_account_details.I_Want_To_options   *4602

#Test Case 10:
Credit_Card_Overview_Account_Details
     [Tags]  Account_Overview
      Login Phone Into Mobile Retails  lcoben6  test  sov12345
      ios_credit_card.Account Overview   *1018

     #Credit Cards My_Money_Account_Details   *4099
#     close application
#Test Case 31:
Credit Cards View Account Details
    [Tags]  Account_Overview
     Login Phone Into Mobile Retails  lcoben6  test  sov12345
     ios_credit_card.Account Details  *1018

Credit_Card_Filtering_Option_All
      [Tags]  Account_Overview    Credit Filters
      Login_App  lcoben3   test   ben12345
      Credit Cards Filtering_Option_All  *1530   20170313   20170426


Credit_Card_Filtering_Option_IN
     [Tags]  Account_Overview   Credit Filters
     Login_App  lcoben12   test   ben12345
     Credit Cards Filtering_Option_IN  *1530   20170313   20170426
#Test test Case 13:
Credit Card Filtering_Option_OUT
     [Tags]  Account_Overview   Credit Filters
     Login_App  robhealthcheck1   test   sov12345
     Credit Cards Filtering_Option_OUT  *8615   20170313   20170426

#Test test Case 14:
Contact_Us
     [Tags]  Contact_Us
     Login Phone Into Mobile Retails   ccdata2   test   sov12345
     ios_contact.Contact Us Iphone

#Test test Case 17:
Go_Paperless_Any
    [Tags]  GO PAPERLESS
    Login Phone Into Mobile Retails  robhealthcheck1   test   sov12345
    go_paperless_any_account    *8526

Go_Paperless_Some
    [Tags]  GO PAPERLESS
    Login Phone Into Mobile Retails  robhealthcheck1   test   sov12345
    Go_Paperless_Any_Some  *9565   *3564

Go_Paperless_All
    [Tags]  GO PAPERLESS
    Login_App  robhealthcheck1   test   sov12345
    Go_Paperless_All_Account
#Test test Case 18:
Help
    [Tags]   HELP
     Login Phone Into Mobile Retails  ccdata5   test   sov12345
     ios_help.Validate Options

#Test test Case 19:
Locations
    [Tags]   LOCATIONS
     Login Phone Into Mobile Retails  ccdata5   test   sov12345
     ios_locations.Search for a Location
#Test test Case 20:
Online_Banking_Agreement
    [Tags]  Terms
    Login Phone Into Mobile Retails  ccdata5   test   sov12345
    ios_online_banking.Validate Page
#Test test Case 21:
Privacy_Policy
    [Tags]  Terms
    Login Phone Into Mobile Retails  ccdata5   test   sov12345
    ios_main_menu.go to privacy policy
#Test test Case 22:
Terms_Of_Use
    [Tags]  Terms
    Login Phone Into Mobile Retails  ccdata5   test   sov12345
    ios_main_menu.Go To Sub Terms of Use
#Test test Case 23:

Statement_List
    [Tags]  Statements
    Login_App  lcorobm64  test  1234abcd
    statements.List Of Statements
#Test Case 24:
Statement_Search
    [Tags]  Statements
     Login_App  lcorobm64  test  1234abcd
#    Search date with in six months
    statements.Statements_Search     *4602    20170301   20170427
#Test Case 25:
No_Statements_Available
    [Tags]  Statements
    Login_App  lcorobm64  test  1234abcd
    statements.Statements_Search    *4602     20170301   20170520
#Test Case 26:
Statements Search Negative
##    Search date more than six months
    [Tags]  Statements
      Login_App  robhealthcheck1   test   sov12345
      statements.Statements Search Negative    *3564    20160601   20170425

Bill Pay Single Payment
    [Tags]  Single_payment
     Login_App  robtest4  test  1234abcd
     bill_pay.Single Payment   Test Biller 2   0.05  20170618

Bill Pay Single Payment Cancel
  [Tags]   Single_payment  Cancel_Single_Payment
     Login_App  robtest4  test  1234abcd
     bill_pay.Single Payment Cancel    Test Biller 2   0.06  20170622

#Test Case 33:
Transfer Beetween Account
    [Tags]  Transfers  Transactions  Transactions_Between_Accounts
     Login Phone Into Mobile Retails  ccdata5   test   sov12345
     ios_transfers.Make Transfer Beetween Account   *8526   *8615

#Test Case 34:
Transfer Beetween Account Future
     [Tags]  Transfers  Transactions  Transactions_Between_Accounts
     Login Phone Into Mobile Retails  ccdata5   test   sov12345
     Make Transfer Beetween Account Future   *8526   *8615  20170615
#Test Case 35:
Transfer To Somone Else
     [Tags]  Transfers  Transfer To Somone Else
     Login Phone Into Mobile Retails  ccdata5   test   sov12345
     make transfer to someone else  9393  4552
#Test Case 36:
Transfer To Somone Else Future
     [Tags]  Transfers  Transfer To Somone Else
     Login Phone Into Mobile Retails  ccdata5   test   sov12345
     Make Transfer To Someone Else Future  9393  4552  20170617

#Forgot Password - Negative - Block card after 3 attempts with a wrong PIN
#    Login_App  robhealthcheck  test  sov12345
#
Forgot Password Negative Incorrect UserID
    [Tags]  Forgot Password Negative    Forgot Password

    ios_forgot_password.Incorrect UserID  mmmmm  19900101

Forgot Password new pw is empty
    [Tags]  Forgot Password Negative    Forgot Password
    New Password Is Empty   lcoben12  19900101   test   2872   7101  ben12345  ${EMPTY}


Forgot Password - Negative - new pw is just characters (no digits)
    [Tags]  Forgot Password Negative     Forgot Password
    new pw is just characters no digits  lcoben6  19900101   test   2872   7101   lcotest  lcotest

Forgot Password - Negative - new pw is just numeric digits
    [Tags]  Forgot Password Negative    Forgot Password
    new pw is just numeric digits   lcoben6  19900101   test   2872   7101   1234567  1234567

Forgot Password - Negative - new pw is less than 6 alphanumeric characters
    [Tags]  Forgot Password Negative    Forgot Password
    new pw is less than 6 alphanumeric characters   lcoben6  19900101   test   2872   7101   sov12  sov12

Forgot Password - Negative - new pw is more than 12 alphanumeric digits
    [Tags]  Forgot Password Negative    Forgot Password
    new pw is more than 12 alphanumeric digits   lcoben6  19900101   test   2872   7101   sov12345678910  sov12345678910

Forgot Password - Negative Test Case - new pw that doesn’t match
    [Tags]  Forgot Password Negative   Forgot Password
    new pw that not match  lcoben6  19900101   test   2872   7101   sov12345  bov1234

Forgot Password - Recover a password with minimum length (6 alphanumeric characters)
    [Tags]  Forgot Password Positive    Forgot Password
    Restore Password Successfully  lcoben6  19900101   test   2872   7101   sov12345  sov12345

Forgot Password - Recover a pw for a Credit Card
    [Tags]  Forgot Password Positive    Forgot Password
    Restore Password Successfully  lcoben6  19900101   test   2872   7101   sov12345  sov12345

Forgot Password - Recover a pw for a Debit Card
    [Tags]  Forgot Password Positive    Forgot Password
    Restore Password Successfully  lcoben6  19900101   test   2872   7101   sov12345  sov12345

Forgot Password - Recover a pw with maximum length (12 alphanumeric characters)
    [Tags]  Forgot Password Positive    Forgot Password
    Restore Password Successfully  lcoben6  19900101   test   2872   7101   sov12345  sov12345

Forgot Password - Recover a pw with medium length (9 alphanumeric characters)
    [Tags]  Forgot Password Positive   Forgot Password
    Restore Password Successfully  lcoben6  19900101   test   2872   7101   sov12345  sov12345

Quick Balance Checking Account
    [Tags]  Quick Balance
     login_app and remember credential  lcorobm64  test  1234abcd
     quickbalance.Checking Account  *4602
     Validate Account in Quick Settings  SANTANDER PREMIER PLUS CHECKING
     log in quick settings  test  1234abcd
     quickbalance.Checking Account  *4696
     Validate Account in Quick Settings  SANTANDER PREMIER PLUS CHECKING
     Switch User ID

Quick Balance - Savings Account
     [Tags]  Quick Balance
     login_app and remember credential  lcorobm64  test  1234abcd
     quickbalance.Checking Account  *4785
     Validate Account in Quick Settings  SANTANDER SAVINGS
     Switch User ID


Quick Balance - Credit Card Account
      [Tags]  Quick Balance
     login_app and remember credential  lcorobm64  test  1234abcd
     quickbalance.Checking Account  *2331
     Validate Account in Quick Settings  BRAVO
     Switch User ID
Quick Balance - Heloc Account
      [Tags]  Quick Balance
     login_app and remember credential  lcorobm64  test  1234abcd
     quickbalance.Checking Account  *4475
     Validate Account in Quick Settings  MONEY MARKET
     Switch User ID
Quick Balance - Loan Account
      [Tags]  Quick Balance
     login_app and remember credential  robhealthcheck1  test  sov12345
     quickbalance.Checking Account  *4302
     Validate Account in Quick Settings  MORTGAGES

Main Login Page Switch User ID
    [Tags]  Quick Balance
    Switch User ID
    Login_App  robhealthcheck1  test  sov12345