*** Settings ***
Documentation     Data-Driven Login Tests with YAML Integration.
Resource          ../resources/page_objects/LoginPage.robot
Resource          ../core/BaseConfig.robot
Variables         ../data/environment.yaml
Test Setup        Setup Browser And Context
Test Teardown     Close Browser And Capture Error
Test Template     Run Login Scenario

*** Test Cases ***
# CASE NAME               USERNAME                            PASSWORD                           EXPECTED
Valid Login               ${user_data['standard']['user']}    ${user_data['standard']['pass']}    SUCCESS
Locked Out Login          ${user_data['locked']['user']}      ${user_data['locked']['pass']}      Epic sadface: Sorry, this user has been locked out.
Wrong Password Login      ${user_data['standard']['user']}    wrong_password                     Epic sadface: Username and password do not match
Empty Username            ${EMPTY}                            ${user_data['standard']['pass']}    Epic sadface: Username is required

*** Keywords ***
Run Login Scenario
    [Arguments]    ${username}    ${password}    ${expected}
    [Documentation]    English: High-level keyword to handle various login scenarios.
    Submit Login Credentials    ${username}    ${password}
    
    IF    '${expected}' == 'SUCCESS'
        Verify Login Success
    ELSE
        Verify Login Error Message    ${expected}
    END