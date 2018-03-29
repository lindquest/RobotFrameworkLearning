*** Settings ***
Documentation   Tests a search with no direct article result on Wikipedia.
Resource        resource.robot
Suite Setup     Run Keywords    Open Browser To Home Page
...             AND             Register Keyword To Run On Failure  NOTHING
Suite Teardown  Close Browser
Test Setup      Go To Home Page


*** Test Cases ***
Invalid Search
    Input Search    ${INVALID SEARCH}
    Submit Search
    Invalid Search Result Should Be Open    ${INVALID SEARCH}   ${INVALID SEARCH}

Joint Strings Invalid Search
    Input Search with Joint Terms
    Submit Search
    Invalid Search Result with Joint Terms Should Be Open
