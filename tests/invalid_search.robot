***Settings***
Documentation   Tests an invalid search on Wikipedia.
Resource        resource.robot

***Test Cases***
Joint Strings Invalid Search
    Open Browser to Home Page
    ${result} = Join Search Terms
    Input Search    ${result}
    Submit Search
    Invalid Search Result Should Be Open    ${result}
    [Teardown]  Close Browser

Invalid Search
    Open Browser to Home Page
    Input Search    ${INVALID SEARCH}
    Submit Search
    Invalid Search Result Should Be Open    ${INVALID SEARCH}
    [Teardown]  Close Browser