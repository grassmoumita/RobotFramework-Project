*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Test Setup        open the browser with the Mortgage payment url
Test Teardown    Close Browser Session
Resource        resource.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}    css:.nav-link


*** Test Cases ***
Validate UnSuccessful Login
#    open the browser with the Mortgage payment url
    Fill the login form    ${user_name}    ${invalid_password}
    wait until element is located in the page    ${Error_Message_Login}
    verify error message is correct

Validate cards display in the shopping cart
    Fill The Login Form    ${user_name}    ${valid_password}
    wait until element is located in the page    ${Shop_page_load}
    verify card titles in the shop page


*** Keywords ***
#open the browser with the Mortgage payment url
#    Create Webdriver    Chrome
#    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    [arguments]    ${username}    ${password}
    Input Text    name:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

#wait until it checks and display error message
#    Wait Until Element Is Visible    ${Error_Message_Login}

wait until element is located in the page
    [arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

verify card titles in the shop page
    @{expectedlist} =    Create List    iphone XD    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =    Get Webelements    css:.card-title
    @{actuallist} =    Create List
    FOR    ${element}    IN    @{elements}
        log    ${element.text}     #log using for print
        Append To List    ${actuallist}    ${element.text}

    END
    Lists Should Be Equal    ${expectedlist}    ${actuallist}
    

