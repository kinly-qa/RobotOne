*** Settings   ***
Documentation   To validate the Login form.
Resource        resource.robot
Test Setup      Open the browser with Mortgage payment url
Test Teardown   Close Browser


*** Test Cases ***
# Validate Unsuccessful Login
#    Fill the login Form   ${username}   ${invalid_password}
#    Wait Until Element Is located in page   ${error_message_login}
#    Verify error message is correct

# Validate Cards display in the Shopping Page
#    Fill the login Form   ${username}   ${valid_password}
#    Wait Until Element Is located in page   ${checkout_button}
#    Verify Card titles in the Shop page
#    Select the Card     Nokia Edge

Sekect the Form and navigate to Child window
    Fill the login Details and login Form


*** Keywords  ***
Fill the login Details and login Form
    Input Text        id:username   rahulshettyacademy
    Input Password    id:password   learning
    Click Element     css:input[value='user']
    Wait Until Element is Visible   css:.modal-body
    Wait and Click    id:okayBtn
    Select From List By value       css:select.form-control     teach
    Select Checkbox   id:terms
    Checkbox Should Be Selected     id:terms
