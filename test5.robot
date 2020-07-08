*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary

*** Variables ***
${URL}            https://needreceipt.com/
${user}       ppqe 
${Pwd}       za123@za123
${RepoName}        appzen2

${GENERIC_RECPT_BTN}        //img[@alt="Free Editable Generic Receipt Template – Need Receipt"]/ancestor::div[1]//button
${ADD_LOC}            address 
${MAKE_RECP_BTN}            submit     
${DOWNLOAD_BTN}    //button[@class="btn btn-warning downloadReceipt"]  

${UPLOAD_FILE _INPUT_LOC}        upload-manifest-files-input


${SIGN_IN_BTN}                    //a[contains(@href,'/login')]    
${USER_INPUT_LOC}                login_field
${PWD_INPUT_LOC}                password
${SIGN_UP_BTN_LOC}            //input[@type="submit"]
    
*** Test Cases ***
Login
       Open Browser            ${URL}         gc
       Maximize Browser Window
    Wait Until Page Contains Element       //img[@alt="Free Editable Generic Receipt Template – Need Receipt"]/ancestor::div[1]
       Mouse Over        //img[@alt="Free Editable Generic Receipt Template – Need Receipt"]/ancestor::div[1]
    Wait Until Page Contains Element        ${GENERIC_RECPT_BTN}
    Click Element            ${GENERIC_RECPT_BTN}
    Wait Until Page Contains Element        ${ADD_LOC}
    Input Text       ${ADD_LOC}        KOP
    Click Element            ${MAKE_RECP_BTN}
    Wait Until Page Contains Element        ${DOWNLOAD_BTN}
    Click Element        ${DOWNLOAD_BTN}
    

    Go TO             https://github.com/ppqe/appzen1/upload
    Wait Until Page Contains Element           ${SIGN_IN_BTN}
    Click Element          ${SIGN_IN_BTN} 
    Wait Until Page Contains Element           ${USER_INPUT_LOC}
    Sleep        5s
    Input Text            ${USER_INPUT_LOC}        ${user}
    Wait Until Page Contains Element           ${PWD_INPUT_LOC}
    Input Text            ${PWD_INPUT_LOC}        ${Pwd}
    Click Element            ${SIGN_UP_BTN_LOC}
    Sleep        5s
    Choose File            ${UPLOAD_FILE _INPUT_LOC}            C:\\Users\\supatil.SABAONLINE\\Downloads\\Generic Receipt.pdf
    Wait Until Page Contains Element             //div[text()='Generic Receipt.pdf']        10s
    Sleep            8s
    Click Element            //button[@data-edit-text="Commit changes"]
    
    
   