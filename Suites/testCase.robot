*** Settings ***
Resource     ../PageObjects/HomePage/homePage.robot
Resource     ../PageObjects/LoginPage/loginPage.robot
Resource     ../PageObjects/SearchPage/searchPage.robot
Test Setup   Open Flight Application

*** Variables ***
${EMAIL}                    support@ngendigital.com
${PASSWORD}                 abc123
${VALID_FLIGHT_NUMBER}      DA935
${INVALID_FLIGHT_NUMBER}    DA900
${NULL_FLIGHT_NUMBER}       

*** Test Cases ***
User Search Flight Number With Login And Valid Flight Number[DA935]
    Login With Valid Credential        email=${EMAIL}    password=${PASSWORD}
    Open Search Page
    Input Flight Number                flight_number=${VALID_FLIGHT_NUMBER}
    Verify Correct Flight Number

User Search Flight Number With Login And Invalid Flight Number[DA900]
    Login With Valid Credential        email=${EMAIL}    password=${PASSWORD}
    Open Search Page
    Input Flight Number                flight_number=${INVALID_FLIGHT_NUMBER}
    Verify Uncorrect Flight Number

User Search Flight Number With Login And Not Fill Flight Number
    Login With Valid Credential        email=${EMAIL}    password=${PASSWORD}
    Open Search Page
    Input Flight Number                flight_number=${NULL_FLIGHT_NUMBER}
    Verify Uncorrect Flight Number

# Expected To Open Search Page
# Sepertinya terjadi BUG pada fitur Search, Book, dan Check In ketika belum melakukan Sign In
User Search Flight Number Without Login
    Verify Home Screen Appears
    Click Search Button On Home Page Without Login