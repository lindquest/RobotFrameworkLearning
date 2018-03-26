***Settings***
Documentation   Resource file with keywords and variables.
Library         SeleniumLibrary
Library         ../libraries/MyLibrary.py

***Variables***
${BROWSER}      Firefox
${DELAY}        0
${VALID SEARCH}     Brazil
${INVALID SEARCH}   asdkfkasf
${RESULT URL}   https://en.wikipedia.org/wiki/${VALID SEARCH}
${RESULTS URL}  https://en.wikipedia.org/w/index.php?search=
${HOME URL}     https://en.wikipedia.org/wiki/Main_Page

***Keywords***
Open Browser to Home Page
    Open Browser    ${HOME URL}     ${BROWSER}
    Set Selenium Speed      ${DELAY}
    Home Page Should Be Open

Home Page Should Be Open
    Title Should Be     Wikipedia, the free encyclopedia

Input Search
    [Arguments]     ${searchText}
    Input Text      searchInput     ${searchText}

Submit Search
    Click Button    searchButton

Valid Search Result Should Be Open
    Location Should Contain     ${RESULT URL}
    Title Should Be     ${VALID SEARCH} - Wikipedia

Invalid Search Result Should Be Open
    [Arguments]     ${searchText}
    Location Should Contain     ${RESULTS URL}${searchText}
    Title Should Be     ${searchText} - Search results - Wikipedia

Join Search Terms
    ${joint} = Join Two Strings    ${VALID SEARCH}     ${INVALID SEARCH}
    Log To Console "Hello!"
    [Return]    ${joint}