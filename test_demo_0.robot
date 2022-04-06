*** Settings   ***
Documentation   To validate the Login form.
Library         SeleniumLibrary
Resource        resource.robot
Test Setup      Open the browser with Mortgage payment url
Test Teardown   Close Browser



*** Variables  ***
${url}                    https://rahulshettyacademy.com/loginpagePractise/
${error_message_login}    css:.alert-danger


*** Test Cases ***
Validate Unsuccessful Login
    Fill the login Form
    Wait until it checks and display error message
    Verify error message is correct


*** Keywords   ***
Open the browser with url
    Create Webdriver    Chrome    executable_path=chromedriver
    Go To               ${url}

Fill the login Form
    Input Text        id:username   rahulshettyacademy
    Input Password    id:password   password123
    Click Button      xpath://input[contains(@id,'signInBtn')]

Wait until it checks and display error message
    Wait Until Element Is Visible   ${error_message_login}

Verify error message is correct
    Element Text Should Be    ${error_message_login}    Incorrect username/password.
