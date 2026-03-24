*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${INVENTORY_LIST}    css=.inventory_list
${ADD_TO_CART_BTN}   xpath=//button[text()="Add to cart"]
${CART_BADGE}        css=.shopping_cart_badge

*** Keywords ***
Add First Item To Cart
    Wait Until Element Is Visible    ${INVENTORY_LIST}
    Click Button    ${ADD_TO_CART_BTN}

Verify Item Added To Cart
    Element Should Be Visible    ${CART_BADGE}
    Element Text Should Be       ${CART_BADGE}    1