*** Settings   ***
Documentation   To validate the Login form.
Library         SeleniumLibrary
Resource        resource.robot
Test Setup      Open the browser with Mortgage payment url
Test Teardown   Close Browser


*** Test Cases ***
Validate Unsuccessful Login
    Fill the login Form
    Wait until it checks and display error message
    Verify error message is correct
