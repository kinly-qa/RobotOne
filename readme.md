# Robot Framework Tutorial
- Instructor: Rahul Shetty
- Site URL: https://www.udemy.com/course/robot-framework-with-python-selenium/

## Quick Start
```shell
mkdir RobotOne && cd RobotOne
python3 -m venv venv
source venv/bin/activate

pip3 install --upgrade pip
pip3 install --upgrade setuptools
pip3 install robotframework
pip3 install robotframework-SeleniumLibrary # Web
pip3 install robotframework-AppiumLibrary   # Mobile
pip3 install robotframework-requests        # API
pip3 install robotframework-datadriver      # CSV files
pip3 install docutils
pip3 freeze > requirements.txt
pip3 list

```

### Robot Settings, Resource, Library
```robot
*** Settings   ***
Documentation   To validate the Login form.
Library         SeleniumLibrary
Resource        resource.robot
Test Setup      Open the browser with Mortgage payment url
Test Teardown   Close Browser

```

### Robot Variables
```robot
*** Variables  ***
${url}                    https://rahulshettyacademy.com/loginpagePractise/
${error_message_login}    css:.alert-danger

```


### Robot Test Cases
```robot
*** Test Cases ***
Validate Unsuccessful Login
    Fill the login Form
    Wait until it checks and display error message
    Verify error message is correct


```

### Robot Keywords
```robot

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

```
