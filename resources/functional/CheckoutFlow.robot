*** Settings ***
Documentation     Business flows that combine page objects.
Resource          ../page_objects/LoginPage.robot
Variables         ../../data/environment.yaml

*** Keywords ***
Login As Standard User
    [Documentation]    Bridge keyword for E2E tests using YAML data.
    Submit Login Credentials    ${user_data['standard']['user']}    ${user_data['standard']['pass']}
    Verify Login Success

Add Product And Verify
    Log    Adding product to cart...