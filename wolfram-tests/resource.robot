*** Settings ***
Documentation   Resource file with keywords and variables for Wolfram Alpha tests.
Library         SeleniumLibrary
Library         ../libraries/MyLibrary.py

*** Variables ***
${BROWSER}      Firefox
${DELAY}        0
${TIMEOUT}      7
${HOME PAGE}    https://www.wolframalpha.com

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${HOME PAGE}     ${BROWSER}
    Set Selenium Speed      ${DELAY}
    Set Selenium Timeout    ${TIMEOUT}
    Home Page Should Be Open

Go To Home Page
    Go To   ${HOME PAGE}
    Home Page Should Be Open

Home Page Should Be Open
    Title Should Be     Wolfram|Alpha: Computational Knowledge Engine

Input Query
    [Arguments]     ${query}
    Input Text      query     ${query}

Submit Query
    Click Button    equal

