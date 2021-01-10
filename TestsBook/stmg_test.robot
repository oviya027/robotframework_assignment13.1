*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
User should be able to land on Study Overview page
    Login to med
    Verify main page
    #Go to cds
    Verify home page
    #Click on any Study
    #verify details page


*** Keywords ***
Login to med
    Open Browser  https://login-sandbox.imedidata.net/login?  gc
    Maximize Browser Window
    Input Text  id=session_username  Nivethan
    sleep  3s
    Input Text  xpath=//*[@id="session_password"]  White@123
    sleep  3s
    Click Button  id=create_session_link
    sleep  5s

Verify main page
    Verify page content  Study Site Analytics
    ${howmany} =  Get Element Count  xpath=//*[@class='sidebar-container']/div/div
    Log to console  ${howmany}

Verify page content
    [Arguments]  ${expect_page}
    Wait Until Page Contains  ${expect_page}
    Log to console  ${expect_page}
    Log to console  Pass!