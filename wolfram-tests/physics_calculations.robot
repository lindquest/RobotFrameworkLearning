*** Settings ***
Documentation       Test suite containing calculations using Wolfram Alpha.
...                 Test results are validated with data calculated internally.

*** Test Cases ***
Calculate Work
    Provided precondition
    When action
    Then check expectations

*** Keywords ***
Provided precondition
    Setup system under test