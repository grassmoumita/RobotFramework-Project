*** Settings ***
Documentation    A resource file with a reusable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}    1234567
${valid_password}    learning
${url}                https://rahulshettyacademy.com/loginpagePractise/
${browser}    Chrome



*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    ${browser}
    Go To    ${url}
    Maximize Browser Window


Close Browser Session
    Close Browser
