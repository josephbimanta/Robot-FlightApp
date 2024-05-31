*** Settings ***
Resource        ../base.robot
Resource        ../HomePage/homePage.robot
Variables        searchPage-locator.yaml
Library          yaml

*** Keywords ***
Verify Search Page Appears
    Wait Until Element Is Visible                locator=${searchpage_show}

Input Flight Number On Screen
    [Arguments]                                  ${flight_number}
    Wait Until Element Is Visible                locator=${flightnumber_input}
    Input Text                                   locator=${flightnumber_input}    text=${flight_number}

Click Search Button On Search Page
    Wait Until Element Is Visible                locator=${searchbutton_click}
    Click Element                                locator=${searchbutton_click}

Verify Correct Flight Number
    Wait Until Element Is Visible                locator=${flightnumber_correct}

Verify Uncorrect Flight Number
    Wait Until Page Does Not Contain Element     locator=${flightnumber_uncorrect}

Open Search Page
    Click Search Button On Home Page After Login Successfully
    Verify Search Page Appears

Input Flight Number
    [Arguments]                                  ${flight_number}
    Input Flight Number On Screen                flight_number=${flight_number}
    Click Search Button On Search Page