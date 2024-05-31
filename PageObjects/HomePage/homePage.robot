*** Settings ***
Resource        ../base.robot
Variables        homePage-locator.yaml
Library          yaml

*** Keywords ***
Verify Home Screen Appears
    Wait Until Element Is Visible        locator=${homepage_show}
    Element Should Be Visible            locator=${homepage_show}

Click Search Button On Home Page Without Login
    Click Element                        locator=//android.widget.Button[@resource-id="com.example.myapplication:id/button6" and @text="Search"]

Click Search Button On Home Page After Login Successfully
    Click Element                        locator=${searchbutton_header}

Click Sign In Button On Home Page
    Click Element                        locator=${signinbutton_click}