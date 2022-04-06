*** Settings   ***
Documentation   To validate the Login form.
Resource        resource.robot
Test Setup      Open the browser with Mortgage payment url
Test Teardown   Close Browser


*** Test Cases ***
Validate Child Window Functionality
    Select the link of Child Window
    Verify user is switched to Child Window
    Grab the Email Id in the Child Window
    Switch to Parent Window and enter Email Id


*** Keywords  ***
Select the link of Child Window
    Click Element     css:.blinkingText
    Sleep             4

Verify user is switched to Child Window
    Switch window             NEW
    Element Text Should Be    css:h1     DOCUMENTS REQUEST

Grab the Email Id in the Child Window
    ${text}=              Get Text        css:.red
    @{words}=             Split String    ${text}       at
    ${text_split}=        Get From List   ${words}      1
    @{words_2}=           Split String    ${text_split}   #white space
    ${email_id}=          Get From List   ${words_2}    0
    Log                   ${email_id}
    Set Global Variable   ${email_id}

Switch to Parent Window and enter Email Id
    Switch window         MAIN
    Title Should Be       LoginPage Practise | Rahul Shetty Academy
    Fill the login Form   ${email_id}     learning
