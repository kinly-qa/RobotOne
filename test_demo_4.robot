*** Settings   ***
Documentation   To validate the Login form.
Resource        resource.robot
Test Setup      Open the browser with Mortgage payment url
Test Teardown   Close Browser

*** Test Cases ***
Validate Unsuccessful Login
    Fill the login Form     ${username}     ${invalid_password}
    Wait Until Element Is located in page   css:.alert-danger
    Verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login Form     ${username}     ${valid_password}
    Wait Until Element Is located in page   ${checkout_button}
