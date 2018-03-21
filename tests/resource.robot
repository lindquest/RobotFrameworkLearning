***Settings***
Documentation   Resource file with keywords and variables.
Library         SeleniumLibrary

***Variables***
${BROWSER}      Firefox
${DELAY}        1
${VALID SEARCH}     Brazil
${RESULT URL}   https://en.wikipedia.org/wiki/${VALID SEARCH}
${HOME URL}     https://en.wikipedia.org/wiki/Main_Page

***Keywords***
Open Browser to Home Page
    Open Browser    ${HOME URL}     ${BROWSER}
    Set Selenium Speed      ${DELAY}
    Home Page Should Be Open

Home Page Should Be Open
    Title Should Be     Wikipedia, the free encyclopedia

Input Search
    Input Text      searchInput     ${VALID SEARCH}

Submit Search
    Click Button    searchButton

Search Result Should Be Open
    Location Should Contain     ${RESULT URL}
    Title Should Be     ${VALID SEARCH} - Wikipedia