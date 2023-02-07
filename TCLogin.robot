*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Library    Screenshot

*** Variables ***
${url}    https://pasti-e.devlabs.id/
${username_success}    superadmindtn
${password_success}    dtnpasti2022##
${username_fail}        superadmindtn1
${password_fail}        dtnpasti2022#

*** Keywords ***
Open PASTI
    Open Browser    ${url}

*** Test Cases ***
TCLogin - Success
    [Documentation]    Test case Login Success
    [Tags]    Modul User
    Open Browser    https://pasti-e.devlabs.id/login
    Wait Until Element Is Visible    id:email    timeout=5
    Input Text    id:email    superadmindtn
    Input Password    id:password    dtnpasti2022##
    Execute Manual Step    Please complete the CAPTCHA portion of the form
    Click Button    id:finish
    Wait Until Page Contains    Dashboard Super Admin    timeout=10
    Close Browser


TCLogin - Fail
    [Documentation]    Test Case Login Wrong Password
    [Tags]    Modul User
    Open Browser    https://pasti-e.devlabs.id/login
    Wait Until Element Is Visible    id:email    timeout=5
    Input Text    id:email    superadmindtn
    Input Password    id:password    dtnpasti2023##
    Execute Manual Step    Please complete the CAPTCHA portion of the form
    Click Button    id:finish
    Wait Until Page Contains    Username dan Password tidak cocok.    timeout=10
    Close Browser

    