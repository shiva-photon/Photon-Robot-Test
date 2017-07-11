*** Settings ***
Library        Selenium2Library
#Library        ExcelLibrary
Library        robot.libraries.String
#Resource       Shared_Keywords.robot
Library           OperatingSystem


*** Keywords ***

Login_into_ROB_1
    [Tags]    Login_into_ROB
    [Arguments]   &{data}
    Selenium2Library.Register Keyword To Run On Failure     Selenium2Library.Capture Page Screenshot
    set selenium timeout  60s
    Selenium2Library.Open Browser    https://implantacionstg.sov.pre.corp/csstg/ContentServer?pagename=WCSUSAPublica/GSPageDetail/WCCSUSAPub_GSPageDetail_LoginParticulares_PT1&appID=sovereign.wc.WCSUSAPub&cid=1287712905619&c=GSPageDetail&leng=en_US&empr=WCSUSAPublica&canal=CSUSAPub     ie
    Selenium2Library.Wait Until Element Is Enabled    entrada.alias
    Selenium2Library.Input Text      entrada.alias    &{data}[user]
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    Selenium2Library.Click Button    btnSubmit
    Selenium2Library.Wait Until Element Is Enabled    entrada.pregunta.respuestaCliente
    Selenium2Library.Input Text    entrada.pregunta.respuestaCliente   &{data}[answer]
    Selenium2Library.Click Link    btnSubmit
    Selenium2Library.Wait Until Element Is Enabled    entrada.pwd
    Selenium2Library.Input Text    entrada.pwd    &{data}[password]
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    Selenium2Library.Click Link    btnSubmit
    Selenium2Library.wait until element is visible  xpath=//div[contains(@class, 'loading-container ng-scope')]
    Selenium2Library.Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'loading-container ng-scope')]
    Selenium2Library.Wait Until Element Is Visible    xpath=//h2[contains(@class, 'accounts')]
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    Selenium2Library.click link  id=Statements & Documents
    Selenium2Library.wait until page contains  Document Search
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    Selenium2Library.click element   id=idImgBanner
    Selenium2Library.wait until page contains  Go Paperless
    checkbox should be selected     //TBODY[@id="main_tblTabla_BODY"]/TR[1]/TD[4]/DIV[1]/INPUT[1]
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png

    #Selenium2Library.close browser
Login_into_ROB_2
    [Tags]    Login_into_ROB
    [Arguments]   ${user}  ${answer}  ${password}
    #Set Environment Variable   webdriver.chrome(executable_path=/Users/lco/Documents/Robot Dependencies)  chromedriver
    Selenium2Library.Register Keyword To Run On Failure     Selenium2Library.Capture Page Screenshot
    set selenium timeout  40s
    Selenium2Library.Open Browser    https://implantacionstg.sov.pre.corp/csstg/ContentServer?pagename=WCSUSAPublica/GSPageDetail/WCCSUSAPub_GSPageDetail_LoginParticulares_PT1&appID=sovereign.wc.WCSUSAPub&cid=1287712905619&c=GSPageDetail&leng=en_US&empr=WCSUSAPublica&canal=CSUSAPub     chrome
    maximize browser window
    Selenium2Library.Wait Until Element Is Enabled    entrada.alias
    Selenium2Library.Input Text      entrada.alias    ${user}
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    Selenium2Library.Click Button    btnSubmit
    Selenium2Library.Wait Until Element Is Enabled    entrada.pregunta.respuestaCliente
    Selenium2Library.Input Text    entrada.pregunta.respuestaCliente   ${answer}
    Selenium2Library.Click Link    btnSubmit
    Selenium2Library.Wait Until Element Is Enabled    entrada.pwd
    Selenium2Library.Input Text    entrada.pwd    ${password}
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    Selenium2Library.Click Link    btnSubmit
    Selenium2Library.wait until element is visible    //*[@id="Account Services"]
#    Selenium2Library.wait until element is visible  xpath=//div[contains(@class, 'loading-container ng-scope')]
#    Selenium2Library.Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'loading-container ng-scope')]
#    Selenium2Library.Wait Until Element Is Visible    xpath=//h2[contains(@class, 'accounts')]
    #Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    Selenium2Library.click link    //*[@id="Account Services"]   #//*[@id="Statements & Documents"]
    Selenium2Library.wait until page contains    Turn off Paper Statements
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    Selenium2Library.click element   //*[contains(@class,"txtPuntoRojo") and .//text()="Turn off Paper Statements"]    #//*[@id="0"]/span   #//*span[@text="Turn off Paper Statements"]
    Selenium2Library.Wait Until Element Is Visible   //*[@id="main_titPrincipal_REPAINT"]/span[1]
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    Selenium2Library.wait until page contains  Go Paperless
    #//a[contains(@class,'btnX') and .//text()='Sign in']

First Login On Desktop
    [Arguments]  ${user_id}   ${password}
    Selenium2Library.Register Keyword To Run On Failure     Selenium2Library.Capture Page Screenshot
    set selenium timeout  60s
    Selenium2Library.Open Browser    https://implantacionstg.sov.pre.corp/csstg/ContentServer?pagename=WCSUSAPublica/GSPageDetail/WCCSUSAPub_GSPageDetail_LoginParticulares_PT1&appID=sovereign.wc.WCSUSAPub&cid=1287712905619&c=GSPageDetail&leng=en_US&empr=WCSUSAPublica&canal=CSUSAPub     safari
    Selenium2Library.Wait Until Element Is Enabled    entrada.alias
    Selenium2Library.Input Text      entrada.alias    ${user_id}
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    Selenium2Library.Wait Until Element Is Enabled   id=btnSubmit
    Selenium2Library.Click Button    id=btnSubmit
    Selenium2Library.Wait Until Element Is Enabled    entrada.pwd
    Selenium2Library.Input Text    entrada.pwd    ${password}
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    Selenium2Library.Click Link    btnSubmit
#    Selenium2Library.wait until page contains   Electronic Communications Disclosure
#    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
#    Selenium2Library.select radio button     radioElectComm     radioElectCommAccept
#    Selenium2Library.Capture Page Screenshot
#    Selenium2Library.click link    id=main_btnContinue_enlace
#    Selenium2Library.wait until page contains   Service Agreement
#    Selenium2Library.select radio button     radioAgreement     radioAgreementAccept
#    Selenium2Library.Capture Page Screenshot
#    Selenium2Library.click link    id=main_btnContinue_enlace
    Selenium2Library.wait until page contains   Select your Image
    Selenium2Library.Capture Page Screenshot
    Selenium2Library.Input Text    inputPhrase   mobileretails
    Selenium2Library.Input Text    inputAnswer1    test
    Selenium2Library.Input Text    inputAnswer2    test
    Selenium2Library.Input Text    inputAnswer3    test
    Selenium2Library.Capture Page Screenshot
    Selenium2Library.click link    id=main_btnContinue_enlace
    Selenium2Library.wait until page contains     Verify your SSA Information
    Selenium2Library.Capture Page Screenshot
    Selenium2Library.click link    id=main_btnConfirm_enlace
    Selenium2Library.wait until page contains    Verify your Contact Details
    Selenium2Library.click button   Continue
    Selenium2Library.wait until page contains     Keep your statements accessible, organized and secure!
    Selenium2Library.Capture Page Screenshot
    Selenium2Library.select checkbox    all
    Selenium2Library.Capture Page Screenshot
    Selenium2Library.click button   Continue
    Selenium2Library.wait until page contains   Remember to download our easy and convenient Mobile App.
    Selenium2Library.Capture Page Screenshot
    Selenium2Library.click button   Continue To Online Banking
    Selenium2Library.wait until page contains  The following accounts are now Paperless!
    Selenium2Library.Capture Page Screenshot
    Selenium2Library.click button   Continue To Online Banking
    Selenium2Library.wait until page contains    Quick Transfer
    Selenium2Library.Capture Page Screenshot

#Get Lib
#    [Arguments]  ${path}  ${sheet}
#    @{data}=  get data by column name  ${path}  ${sheet}
#    :FOR    ${ELEMENT}    IN     @{data}
#      \  log to console  ${ELEMENT}

Get Table Row Index By text
    [Arguments]  ${rowLocator}  ${column}  ${cellText}
    ${rowNumber}  set variable  0
    ${rowIndex}  set variable  0
    ${rowCount}  Selenium2Library.Get Matching Xpath Count  ${rowLocator}
    : FOR  ${rowIndex}  IN RANGE  1  ${rowCount}+1
    \  ${curText}  Selenium2Library.Get Text  ${rowLocator}[${rowIndex}]/td[${column}]/span
    \  log to console  ${curText}
    \  ${bStatus}=   Run Keyword And Return Status  should match  ${curText}  ${cellText}
    \  Exit For Loop If  ${bStatus}
    ${rowNumber}  Set Variable  ${rowIndex}
    [Return]  ${rowNumber}
Validate Paperless Is Selected
    [Arguments]  ${account}
    Selenium2Library.register keyword to run on failure  close browser
    Selenium2Library.Wait Until Element Is Visible   //TBODY[@id="main_tblTabla_BODY"]
    ${indexrow}  get table row index by text   //TBODY[@id="main_tblTabla_BODY"]/TR  1  ${account}   #*3414
    log to console  ${indexrow}
    Selenium2Library.checkbox should be selected     //TBODY[@id="main_tblTabla_BODY"]/TR[${indexrow}]/TD[4]/DIV[1]/INPUT[1]
    Selenium2Library.Capture Page Screenshot    filename=${TEST_NAME}-{index}.png
    close browser







