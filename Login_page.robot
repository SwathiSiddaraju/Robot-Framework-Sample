*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.


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



