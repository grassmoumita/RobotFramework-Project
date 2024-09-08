*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser
#Resource

*** Variables ***
${Error_Message_Login}    css:.alert-danger
${IMPLICIT_WAIT}    5s


*** Test Cases ***
Validate UnSuccessful Login
    open the browser with the Mortgage payment url
    Fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Maximize Browser Window

Fill the login form
    Input Text    name:username    rahulshettyacademy
    Input Password    id:password    12345678
    Click Button    id:signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.


    
