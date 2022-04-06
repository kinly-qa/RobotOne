*** Settings   ***
Documentation   To validate the Login form.
Library         SeleniumLibrary
Library         DataDriver      file=resources/data.csv     encoding=utf_8    dialect=unix
Test Teardown   Close Browser
Test Template   Validate Unsuccessful Login


*** Test Cases ***
Login with user ${username} and password ${password}    default   pwd


*** Keywords   ***
Validate Unsuccessful Login
    [arguments]       ${username}   ${password}
    Open the browser with Mortgage payment url
    Fill the login Form   ${username}   ${password}
    Wait until it checks and display error message
    Verify error message is correct

Open the browser with Mortgage payment url
    Create Webdriver    Chrome    executable_path=chromedriver
    Go To               ${url}

Fill the login Form
    [arguments]       ${username}   ${password}
    Input Text        id:username   ${username}
    Input Password    id:password   ${password}
    Click Button      signInBtn

Wait until it checks and display error message
    Wait Until Element Is Visible   ${error_message_login}

Verify error message is correct
    Element Text Should Be    ${error_message_login}    Incorrect username/password.


*** Variables  ***
${error_message_login}    css:.alert-danger
${url}                    https://rahulshettyacademy.com/loginpagePractise/
