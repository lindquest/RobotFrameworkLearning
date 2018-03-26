*** Settings ***
Documentation   Tests an invalid search on Wikipedia.
Resource        resource.robot

*** Test Cases ***
Joint Strings Invalid Search
    Open Browser to Home Page
    ${search} =     Join Search Terms
    Input Search    ${search}
    Submit Search
    ${result} =     Join Results Terms
    Invalid Search Result Should Be Open    ${result}   ${search}
    [Teardown]  Close Browser

Invalid Search
    Open Browser to Home Page
    Input Search    ${INVALID SEARCH}
    Submit Search
    Invalid Search Result Should Be Open    ${INVALID SEARCH}   ${INVALID SEARCH}
    [Teardown]  Close Browser