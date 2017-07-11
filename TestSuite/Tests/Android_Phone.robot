*** Settings ***
Variables        ../Lib/testdata.py
Library          ../Lib/MyLibrary.py
#Library          FakerLibrary
Library          Process
Library          AppiumLibrary
                 ...  run_on_failure=get screenshot
Resource         ../Resources/Android_PO/login.robot
Resource         ../Resources/Android_PO/overview.robot
Resource         ../Resources/Android_PO/account_details.robot
Resource         ../Resources/Android_PO/term_of_use.robot
Resource         ../Resources/Android_PO/credit_card.robot
Resource         ../Resources/Android_PO/statements.robot
Resource         ../Resources/Android_PO/bill_pay.robot
Resource         ../Resources/Android_PO/quickbalance.robot
Resource         ../Resources/Android_PO/transfers.robot
Resource         ../Resources/Android_PO/first_login.robot
Resource         ../Resources/Android_PO/forgot_password.robot
#C:\Users\x368871\AppData\Local\Android\Sdk

Documentation   Android Phone Report

Test Setup          Open_Nexus5X  #Launch_Galaxy_S7_Sim  #Lounch_Nexus_6P_Sim  #Launch_Galaxy_S7_Sim   #Lounch_Galaxy_S5   # Lounch_Nexus_6_Sim_5.1.1  #Lounch_Nexus_6P_Sim   #Lounch_Galaxy_S5    #Lounch_Nexus_6P_Sim        #Lounch_Galaxy_S5     # Login_App  robhealthcheck  test  sov12345 Lounch_Nexus_6P_Sim
Test Teardown       close application
*** Variables ***
#ACCOUNT_OVERVIEW_LOGIN=  {'user': 'ccdata1', 'answer': 'test', 'password': 'sov12345'}
${path}=  Data/CreditCards.xlsx
${sheet} =  2272017_051332986
*** Test Cases ***


Login With Incorrect User Id
   [Tags]  Login  Login Negative
   [Documentation]  Login With Incorrect User Id  Negative
    login.Incorrect User Id   dgdfgdfg1  test  sov12345

Login With Incorrect Password
    [Tags]  Login  Login Negative
    [Documentation]  Login With Incorrect Password  Negative
    login.Incorrect Password  ccdata12  test  efvghabcd

Main_Login_Page
    [Tags]  Login  Login Positive
    [Documentation]  Main_Login_Page Positive
    Login_App  ccdata12  test  sov12345

Log Off
    [Tags]  Login  Login Positive
    [Documentation]  Log Off  Positive
    Login_App   ccdata12  test  sov12345
    login.Log Off

First Login Edit SSA fields
    [Tags]  First Login  First Login Positive
    first_login.Edit SSA fields   ccdata12  test  sov12345

First Login Incorrect Account number Error Message
    [Tags]  first_login   first login negative  negative message
    first_login.Incorrect Account number Error Message     968981357     san1231357     34595640

First Login Incorrect Debit Card number Error Message
    [Tags]  first_login  first login negative   negative message
   first_login.Incorrect Debit Card number Error Message   968981357     san1231357     40816566980934960

First Login Incorrect Credit Card number Error Message
    [Tags]  first_login  first login negative  negative message
    first_login.Incorrect Credit Card number Error Message   968981357     san1231357     40816566980914456

First Login Negative New Password
    [Tags]  First Login  first login negative
    first_login.New Password Negative   968981357     san1231357     5129920072044799        Testid8      sov12345

First Login Incorrect Account number
    [Tags]  First Login  first login negative
    first_login.Incorrect Account number   968981357     san1231357     40816566

First Login New incorrect UserId and PW and new PW doesnt match
    [Tags]  First Login  first login negative
    [Documentation]  This test requires a new temp login, password, account number and unique id
    first_login.Incorrect UserId and PW   968981357     san1231357     5129920072044799        Testid8      sov12345

First Login New Password 12 Characters
    [Tags]  First Login  First Login Positive
    [Documentation]  This test requires a new temp login, password, account number and unique id
    first_login.New Password 12 Characters     976257580	san1237580	5129915133747794    Testid20     sov123456789

First Login New Password 6 Characters
    [Tags]  First Login  First Login Positive
    [Documentation]  This test requires a new temp login, password, account number and unique id
    first_login.New Password 6 Characters    976198510	san1238510	9111449748  Testid21  sov123

First Login No Paperless accounts selected
    [Tags]  First Login  First Login Positive
    first_login.No Paperless accounts selected   976143556	san1233556	9995119846   Testid22   sov12345

First Login Switch between Rob mobile and Desktop
    [Tags]  First Login  First Login Positive
    #first_login.Switch between Rob mobile and Desktop   robhealthcheck  test  sov12345
    Login_App    985275351   san1235351	 9995114542

First Login User leaves the app in the middle on the procces
    [Tags]  First Login  First Login Positive
    first_login.Leave in the middle     976084905	san1234905	5129915133747794	Testid23   sov12345

Account_Overview
      [Tags]  Account_Overview
      Login_App    ccdata2  test  sov12345
      My_Money_Account_Overview   *4099
#      close application

Overview_Account_Details
     [Tags]  Account_Overview
     Login_App  lcoben12   test   sov12345
     My_Money_Account_Details   *4453
#     close application

Filtering_Option_All
      [Tags]  Account_Overview   Filters
      Login_App  lcoben12   test   sov12345
      Filtering_Option_All   *4453   20170601   20170626

Filtering_Option_IN
     [Tags]  Account_Overview   Filters
     Login_App  lcoben12   test   sov12345
     Filtering_Option_IN    *4453   20170601   20170626

Filtering_Option_OUT
     [Tags]  Account_Overview   Filters
     Login_App  lcoben12   test   sov12345
     Filtering_Option_OUT   *4453   20170601   20170626

I_Want_To_options
    [Tags]  Account_Overview
    Login_App  robtest4   test   1234abcd
    I_Want_To_options   *2927

#Test Case 10:
Credit_Card_Overview_Account_Details
     [Tags]  Account_Overview
     Login_App  lcoben3  test  ben12345
     My_Money_Account_Overview   *1018
     #Credit Cards My_Money_Account_Details   *4099
#     close application
#Test Case 31:
Credit Cards View Account Details
    [Tags]  Account_Overview
     Login_App  lcoben12  test  ben12345
     credit_card.View Account Details  *1018

Credit_Card_Filtering_Option_All
      [Tags]  Account_Overview    Credit Filters
      Login_App  lcoben12   test   ben12345
      Credit Cards Filtering_Option_All  *1530   20170313   20170426


Credit_Card_Filtering_Option_IN
     [Tags]  Account_Overview   Credit Filters
     Login_App  lcoben12   test   sov12345
     Credit Cards Filtering_Option_IN  *1018   20170313   20170426
#Test test Case 13:
Credit Card Filtering_Option_OUT
     [Tags]  Account_Overview   Credit Filters
     Login_App  lcoben12   test   sov12345
     Credit Cards Filtering_Option_OUT  *1018   20170313   20170426
Credit Cards Single Payment
    Login_App  ccdata5   test   sov12345
    credit_card.single payment  3839  0.1
Credit Cards Single Payment Future
    Login_App  ccdata5   test   sov12345
    credit_card.single payment future  3839  0.1  20170712

#Test test Case 14:
Contact_Us
     [Tags]  Contact_Us
     Login_App  lcoben12   test   sov12345
     contact_us

#Test test Case 17:
Go_Paperless_Any
    [Tags]  GO PAPERLESS
    Login_App  lcoben12   test   sov12345
    go_paperless_any_account    *7460

Go_Paperless_Some
    [Tags]  GO PAPERLESS
     Login_App  lcoben12   test   sov12345
    Go_Paperless_Any_Some  *4453   *8866

Go_Paperless_All
    [Tags]  GO PAPERLESS
    Login_App  lcoben12   test   sov12345
    Go_Paperless_All_Account
#Test test Case 18:
Help
    [Tags]   HELP
     Login_App  lcoben12   test   sov12345
     help_options

#Test test Case 19:
Locations
    [Tags]   LOCATIONS
     Login_App  lcoben12   test   sov12345
     locations
#Test test Case 20:
Online_Banking_Agreement
    [Tags]  Terms
    Login_App  lcoben12   test   sov12345
    Online Banking Service Agreement

Privacy_Policy
    [Tags]  Terms
    Login_App  lcoben12   test   sov12345
    Privacy Policy

Terms_Of_Use
    [Tags]  Terms
    Login_App  lcoben12   test   sov12345
    Terms of use

Statement_List
    [Tags]  Statements
    Login_App  lcorobm64  test  1234abcd
    statements.List Of Statements

Statement_Search
    [Tags]  Statements
     Login_App  lcorobm64  test  1234abcd
#    Search date with in six months
    statements.Statements_Search     *4602    20170301   20170427

No_Statements_Available
    [Tags]  Statements
    Login_App  lcorobm64  test  1234abcd
    statements.Statements_Search    *4602     20170301   20170520
#Test Case 26:
Statements Search Negative
##    Search date more than six months
    [Tags]  Statements
      Login_App  lcoben12   test   sov12345
      statements.Statements Search Negative    *3564    20160601   20170425

Bill Pay Single Payment
    [Tags]  Single_payment
     Login_App  robtest4  test  1234abcd
     bill_pay.Single Payment   Test Biller 2   0.05  20170629

Bill Pay Single Payment Cancel
  [Tags]   Single_payment  Cancel_Single_Payment
     Login_App  robtest4  test  1234abcd
     bill_pay.Single Payment Cancel    Test Biller 2   0.06  20170627lco

#Test Case 33:
Transfer Beetween Account
    [Tags]  Transfers  Transactions  Transactions_Between_Accounts
     Login_App  lcoben12  test  sov12345
     Make Transfer Beetween Account   *4443   *8866

#Test Case 34:
Transfer Beetween Account Future
     [Tags]  Transfers  Transactions
     Login_App  lcoben12  test  sov12345
     Make Transfer Beetween Account Future   *4443   *8866  20170629
#Test Case 35:
Transfer To Somone Else
     [Tags]  Transfers  Transactions
     Login_App  lcorobm64  test  1234abcd
     make transfer to someone else  4602  8378
#Test Case 36:
Transfer To Somone Else Future
     [Tags]  Transfers  Transactions
     Login_App  robtest1  test  1234abcd
     Make Transfer To Someone Else Future  4606  8378  20170630

#Forgot Password - Negative - Block card after 3 attempts with a wrong PIN
#    Login_App  robhealthcheck  test  sov12345
#
Forgot Password Negative Incorrect UserID
    [Tags]  Forgot Password Negative

    forgot_password.Incorrect UserID  ldbghe  19900101

Forgot Password new pw is empty
    [Tags]  Forgot Password Negative
    New Password Is Empty   lcoben4  19900101   test   2872   7101  sov12345  ${EMPTY}


Forgot Password - Negative - new pw is just characters (no digits)
    [Tags]  Forgot Password Negative
    new pw is just characters no digits  lcoben4  19900101   test   2872   7101   lcotest  lcotest

Forgot Password - Negative - new pw is just numeric digits
    [Tags]  Forgot Password Negative
    new pw is just numeric digits   lcoben4  19900101   test   2872   7101   1234567  1234567

Forgot Password - Negative - new pw is less than 6 alphanumeric characters
    [Tags]  Forgot Password Negative
    new pw is less than 6 alphanumeric characters   lcoben4  19900101   test   2872   7101   sov12  sov12

Forgot Password - Negative - new pw is more than 12 alphanumeric digits
    [Tags]  Forgot Password Negative
    new pw is more than 12 alphanumeric digits   lcoben4  19900101   test   2872   7101   sov12345678910  sov12345678910

Forgot Password - Negative Test Case - new pw that doesn’t match
    [Tags]  Forgot Password Negative
    new pw that not match  lcoben4  19900101   test   2872   7101   sov12345  bov1234

Forgot Password - Recover a password with minimum length (6 alphanumeric characters)
    [Tags]  Forgot Password Positive
    Restore Password Successfully  lcoben4  19900101   test   2872   7101   ben12345  ben12345

Forgot Password - Recover a pw for a Credit Card
    [Tags]  Forgot Password Positive
    Restore Password Successfully  lcoben4  19900101   test   2872   7101   sov12345  sov12345

Forgot Password - Recover a pw for a Debit Card
    [Tags]  Forgot Password Positive
    Restore Password Successfully  lcoben9  19900101   test   2872   7101   ben12345  ben12345

Forgot Password - Recover a pw with maximum length (12 alphanumeric characters)
    [Tags]  Forgot Password Positive
    Restore Password Successfully  lcoben26  19900101   test   2872   7101   ben12345  ben12345

Forgot Password - Recover a pw with medium length (9 alphanumeric characters)
    [Tags]  Forgot Password Positive
    Restore Password Successfully  lcoben26  19900101   test   2872   7101   sov12345  sov12345

Quick Balance Checking Account
    [Tags]  Quick Balance
     login_app and remember credential  lcorobm64  test  1234abcd
     quickbalance.Checking Account  *4696
     Validate Account in Quick Settings  SANTANDER PREMIER PLUS CHECKING
     log in quick settings  test  1234abcd
     quickbalance.Checking Account  *4750
     Validate Account in Quick Settings  SIMPLY RIGHT CHECKING
     Switch User ID

Quick Balance - Savings Account
     [Tags]  Quick Balance
     login_app and remember credential  lcorobm64  test  1234abcd
     quickbalance.Checking Account  *4785
     Validate Account in Quick Settings  SANTANDER SAVINGS
     Switch User ID


Quick Balance - Credit Card Account
      [Tags]  Quick Balance
     login_app and remember credential  ccdata12  test  sov12345
     quickbalance.Checking Account  *0378
     Validate Account in Quick Settings  SPHERE
     Switch User ID
Quick Balance - Heloc Account
      [Tags]  Quick Balance
     login_app and remember credential  ccdata12  test  sov12345
     quickbalance.Checking Account  *0225
     Validate Account in Quick Settings  UNSECURED LOC
     Switch User ID
Quick Balance - Loan Account
      [Tags]  Quick Balance
     login_app and remember credential  robhealthcheck1  test  sov12345
     quickbalance.Checking Account  *4302
     Validate Account in Quick Settings  MORTGAGES

Main Login Page Switch User ID
    [Tags]  Quick Balance
    Switch User ID
    Login_App  ccdata12  test  sov12345