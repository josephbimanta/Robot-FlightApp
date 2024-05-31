*** Settings ***
Resource         ../base.robot
Resource         ../HomePage/homePage.robot
Variables        loginPage-locator.yaml
Library          yaml


*** Keywords ***
Input Email
    [Arguments]                          ${email}
    Wait Until Element Is Visible        locator=${email_input}
    Input Text                           locator=${email_input}   text=${email}

Input Password
    [Arguments]                          ${password}
    Input Text                           locator=${password_input}    text=${password}

Click Sign In Button
    Click Element                        locator=${signin_button}

Verify User Successfully Login
    Wait Until Element Is Visible        locator=${homepage_show}
    Element Should Be Visible            locator=${homepage_show}

Login With Valid Credential
    [Arguments]                          ${email}    ${password}
    Verify Home Screen Appears
    Click Sign In Button On Home Page
    Input Email                          email=${email}
    Input Password                       password=${password}
    Click Sign In Button
    Verify User Successfully Login
