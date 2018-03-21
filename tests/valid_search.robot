***Settings***
Documentation   Tests a single valid search on Wikipedia.
Resource        resource.robot

***Test Cases***
Valid Search
    Open Browser to Home Page
    Input Search
    Submit Search
    Search Result Should Be Open
    [Teardown]  Close Browser