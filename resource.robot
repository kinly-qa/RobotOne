*** Settings   ***
Documentation   A resource file with resuable keywords and variables
Library         SeleniumLibrary
Library         Collections


*** Variables  ***
${url}                    https://rahulshettyacademy.com/loginpagePractise/
${username}               rahulshettyacademy
${invalid_password}       password123
${valid_password}         learning

# Locators
${signInBtn}              xpath://input[contains(@id,'signInBtn')]
${error_message_login}    css:.alert-danger
${checkout_button}        css:.nav-link
${card_title_list}        css:.card-title
${card_add_button}        xpath:(//*[@class='card-footer'])[4]/button

*** Keywords   ***
Open the browser with Mortgage payment url
    Create Webdriver    Chrome    executable_path=chromedriver
    Go To               ${url}

Fill the login Form
    [arguments]       ${username}   ${password}
    Input Text        id:username   ${username}
    Input Password    id:password   ${password}
    Click Button      ${signInBtn}

Verify error message is correct
    Element Text Should Be    ${error_message_login}    Incorrect username/password.

Wait Until Element Is located in page
    [arguments]   ${element}
    Wait Until Element Is Visible   ${element}

Verify Card titles in the Shop page
    @{expected_list} =    Create List   iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =         Get WebElements   ${card_title_list}
    @{actual_list} =      Create List

    FOR   ${element}  IN    @{elements}
        Log                 ${element.text}
        Append To List      ${actual_list}    ${element.text}
    END

    Lists Should Be Equal   ${expected_list}    ${actual_list}

Select the Card
    [arguments]   ${card_name}
    ${elements} =         Get WebElements   ${card_title_list}
    ${index} =            Set Variable      1

    FOR   ${element}  IN    @{elements}
        Exit For Loop If    '${card_name}' == '${element.text}'
        ${index} =    Evaluate   ${index} + 1
    END

    Click Button  xpath:(//*[@class='card-footer'])[${index}]/button

Wait and Click
    [arguments]   ${element}
    Wait Until Element Is Visible   ${element}
    Click Element     ${element}
