*** Settings ***
Documentation     Low-level keywords for the Login Page.
Library           SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}      id=user-name
${PASSWORD_FIELD}      id=password
${LOGIN_BUTTON}        id=login-button
${ERROR_CONTAINER}     css=h3[data-test="error"]
${INVENTORY_CONTAINER}  id=inventory_container

*** Keywords ***
Submit Login Credentials
    [Arguments]    ${username}    ${password}
    [Documentation]    English: Enters username/password and clicks login.
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=10s
    Input Text       ${USERNAME_FIELD}    ${username}
    Input Password   ${PASSWORD_FIELD}    ${password}
    Click Button     ${LOGIN_BUTTON}

Verify Login Success
    [Documentation]    English: Verifies successful navigation after login.
    Wait Until Element Is Visible    ${INVENTORY_CONTAINER}    timeout=5s

Verify Login Error Message
    [Arguments]    ${expected_message}
    [Documentation]    English: Validates visible error messages.
    Wait Until Element Is Visible    ${ERROR_CONTAINER}    timeout=5s
    Element Should Contain           ${ERROR_CONTAINER}    ${expected_message}