*** Settings   ***
Documentation   A resource file with resuable keywords and variables
Library         SeleniumLibrary


*** Keywords   ***
Open the browser with Mortgage payment url
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


*** Variables  ***
${error_message_login}    css:.alert-danger
${url}                    https://rahulshettyacademy.com/loginpagePractise/
