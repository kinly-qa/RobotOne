*** Settings   ***
Documentation   A resource file with resuable keywords and variables
Library         SeleniumLibrary


*** Variables  ***
${url}                    https://rahulshettyacademy.com/loginpagePractise/
${username}               rahulshettyacademy
${invalid_password}       password123
${valid_password}         learning
${signInBtn}              xpath://input[contains(@id,'signInBtn')]
${error_message_login}    css:.alert-danger


*** Keywords   ***
Open the browser with Mortgage payment url
    Create Webdriver    Chrome    executable_path=chromedriver
    Go To               ${url}

Fill the login Form
    [arguments]       ${username}   ${password}
    Input Text        id:username   ${username}
    Input Password    id:password   ${password}
    Click Button      ${signInBtn}

Wait until it checks and display error message
    Wait Until Element Is Visible   ${error_message_login}

Verify error message is correct
    Element Text Should Be    ${error_message_login}    Incorrect username/password.
