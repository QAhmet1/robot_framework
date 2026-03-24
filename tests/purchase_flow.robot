*** Settings ***
Documentation      E2E Purchase Flow
Resource           ../resources/functional/CheckoutFlow.robot
Resource           ../core/BaseConfig.robot
Test Setup         Setup Browser And Context
Test Teardown      Close Browser And Capture Error

*** Test Cases ***
Successful Purchase And Inventory Verification
    [Tags]    E2E    Critical
    Given Login As Standard User
    When Add Product And Verify
    Then Page Should Contain    Products