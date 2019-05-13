*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.



*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Username}       robotframework.tyss@gmail.com
${Password}       robotframework@123
${Browser}        Chrome
${SiteUrl}        https://accounts.google.com/signin
${DashboardTitle}   Welcome, robot framework
${response}      Get Text       xpath=//h1[text() = 'Welcome, robot framework']
${Delay}          5s



*** Keywords ***
Open Browser to the Login Page
    Open Browser    ${SiteUrl}    ${Browser}
    Maximize Browser window

Enter User Name
    Input Text    id=identifierId   ${Username}

Click Next
    Click Element     xpath=//div[@role = 'button' and @id='identifierNext']

Enter Password
    Input Password    xpath=//div[@id='password']//input[@type='password']   ${Password}

Click Login
    Click Element   id=passwordNext

Assert Error Message
     should be equal as strings     ${response}       ${DashboardTitle}

Close Browser
    Close All Browsers


#    ${response}    Get Text    xpath=/html/body/div/tr[2]/td/strong
# Should Be Equal As Strings    ${response}    Payment was successful
