*** Settings ***
Documentation   Tests a search with no direct article result on Wikipedia.
Resource        resource.robot

*** Test Cases ***
Invalid Search
    Open Browser to Home Page
    Input Search    ${INVALID SEARCH}
    Submit Search
    Invalid Search Result Should Be Open    ${INVALID SEARCH}   ${INVALID SEARCH}
    [Teardown]  Close Browser

Joint Strings Invalid Search
    Open Browser to Home Page
    Input Search with Joint Terms
    Submit Search
    Invalid Search Result with Joint Terms Should Be Open
    [Teardown]  Close Browser
