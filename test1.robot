*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary

*** Variables ***
${URL}            https://github.com/
${user}       ppqe 
${Pwd}       za123@za123
${RepoName}        appzen2

${SIGN_IN_BTN}                    //a[@href='/login']    
${USER_INPUT_LOC}                login_field
${PWD_INPUT_LOC}                password
${SIGN_UP_BTN_LOC}            //input[@type="submit"]
${NEW_REPO_BTN}                //a[contains(@data-hydro-click,'NEW_REPOSITORY_BUTTON')]
${NEW_REPO_NAME_INPUT_LOC}        repository_name
${CREATE_REPO_BTN_LOC}               //button[contains(@data-disable-with,"Creating repository")]
${USER_ICON_LOC}                    //img[@class="avatar avatar-user "]
${SIGN_OUT_LINK_LOC}                //button[@class="dropdown-item dropdown-signout"]
    
*** Test Cases ***
Login
    Login To Web Site         ${URL}        ${user}        ${Pwd}
    Create New Repo         ${RepoName}
    Sign Out


*** Keywords ***
Login To Web Site    [Arguments]     ${URL}        ${user}        ${Pwd}
    Open Browser        ${URL}          gc
    Wait Until Page Contains Element           ${SIGN_IN_BTN}
    Click Element          ${SIGN_IN_BTN} 
    Wait Until Page Contains Element           ${USER_INPUT_LOC}
    Sleep        5s
    Input Text            ${USER_INPUT_LOC}        ${user}
    Wait Until Page Contains Element           ${PWD_INPUT_LOC}
    Input Text            ${PWD_INPUT_LOC}        ${Pwd}
    Click Element            ${SIGN_UP_BTN_LOC}
    

Create New Repo        [Arguments]        ${RepoName}
    Wait Until Element Is Visible          ${NEW_REPO_BTN}                
    Click Element            ${NEW_REPO_BTN}
    Wait Until Page Contains Element           ${NEW_REPO_NAME_INPUT_LOC}        20s
    Input Text            ${NEW_REPO_NAME_INPUT_LOC}    ${RepoName}
    
    Wait Until Element Is Visible        ${CREATE_REPO_BTN_LOC}            20s
    Sleep        5s
    Click Element        ${CREATE_REPO_BTN_LOC}
    

Sign Out
    Wait Until Page Contains Element        ${USER_ICON_LOC}
    Click Element                    ${USER_ICON_LOC}        
     Wait Until Page Contains Element        ${SIGN_OUT_LINK_LOC}
    Click Element                   ${SIGN_OUT_LINK_LOC}  
            
    