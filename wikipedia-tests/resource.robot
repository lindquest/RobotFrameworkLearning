*** Settings ***
Documentation   Resource file with keywords and variables for Wikipedia tests.
Library         SeleniumLibrary
Library         ../libraries/MyLibrary.py

*** Variables ***
${BROWSER}      Firefox
${DELAY}        0
${VALID SEARCH}     Brazil
${INVALID SEARCH}   asdkfkasf
${RESULT URL}   https://en.wikipedia.org/wiki/${VALID SEARCH}
${RESULTS URL}  https://en.wikipedia.org/w/index.php?search=
${HOME URL}     https://en.wikipedia.org/wiki/Main_Page

*** Keywords ***
Open Browser to Home Page
    Open Browser    ${HOME URL}     ${BROWSER}
    Set Selenium Speed      ${DELAY}
    Home Page Should Be Open

Home Page Should Be Open
    Title Should Be     Wikipedia, the free encyclopedia

Input Search
    [Arguments]     ${searchText}
    Input Text      searchInput     ${searchText}

Input Search with Joint Terms
    ${join} =   Join Search Terms
    Input Search    ${join}

Submit Search
    Click Button    searchButton

Valid Search Result Should Be Open
    Location Should Contain     ${RESULT URL}
    Title Should Be     ${VALID SEARCH} - Wikipedia

Invalid Search Result Should Be Open
    [Arguments]     ${resultText}   ${searchText}
    Location Should Contain     ${RESULTS URL}${resultText}
    Title Should Be     ${searchText} - Search results - Wikipedia

Invalid Search Result with Joint Terms Should Be Open
    ${joinSearch} =     Join Search Terms
    ${joinResult} =     Join Results Terms
    Invalid Search Result Should Be Open    ${joinResult}   ${joinSearch}

Join Search Terms
    ${j} =  Join Two Strings    ${VALID SEARCH}     ${INVALID SEARCH}
    [Return]    ${j}

Join Results Terms
    ${j} =  Join Two Strings With Plus  ${VALID SEARCH}     ${INVALID SEARCH}
    [Return]    ${j}