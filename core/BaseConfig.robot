*** Settings ***
Library    SeleniumLibrary
Variables  ../data/environment.yaml

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Setup Browser And Context
    Open Browser    ${default['base_url']}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${default['timeout']}

Close Browser And Capture Error
    Run Keyword If Test Failed    Capture Page Screenshot
    Close Browser