*** Settings   ***
Documentation   To validate the Login form.
Library         customLibraries/Shop.py
Resource        resource.robot
Test Setup      Open the browser with Mortgage payment url
Test Teardown   Close Browser


*** Variables  ***
@{product_list}    Blackberry      Nokia Edge


*** Test Cases ***
Validate Cards display in the Shopping Page
    Fill the login Form   ${username}   ${valid_password}
    Wait Until Element Is located in page   ${checkout_button}
    Verify Card titles in the Shop page
    Add items to cart and checkout    ${product_list}
