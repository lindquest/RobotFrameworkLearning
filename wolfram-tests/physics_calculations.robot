*** Settings ***
Documentation       Test suite containing calculations using Wolfram Alpha.
...                 Test results are validated with data calculated internally.
Resource            resource.robot
Suite Setup         Run Keywords    Open Browser To Home Page
Suite Teardown      Close Browser
Test Setup          Go To Home Page
Test Template       Input Query And Verify Result

*** Test Cases ***  QUERY
Calculate Work      work F=5N, d=10m

*** Keywords ***
Input Query And Verify Result
    [Arguments]     ${query}
    Input Query     ${query}
    Submit Query
    Result Should Match Expected    ${query}

Result Should Match Expected
    [Arguments]     ${query}
    ${result} =     Calculate Expected Physics Value    ${query}
    Log To Console   ${result}
    Wait Until Page Contains Element    //img[contains(@alt, '${result}')]