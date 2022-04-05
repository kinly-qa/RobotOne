*** Settings   ***
Documentation   To validate the Login form.
Resource        resource.robot
Test Setup      Open the browser with Mortgage payment url
Test Teardown   Close Browser


*** Test Cases ***
Validate Unsuccessful Login
    Fill the login Form   ${username}   ${invalid_password}
    Wait until it checks and display error message
    Verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login Form   ${username}   ${valid_password}
