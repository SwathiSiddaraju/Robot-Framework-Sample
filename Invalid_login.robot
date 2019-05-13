*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.


Library           SeleniumLibrary

*** Variables ***
${Username1}       robotframework.tyss@gmail.com
${Password1}       robotf123
${Browser}        Chrome
${SiteUrl}        https://accounts.google.com/signin
${DashboardTitle1}   Wrong password. Try again or click Forgot password to reset it.
${response1}     Get Text    xpath=//div[@class = 'LXRPh']//div[text() = 'Wrong password. Try again or click Forgot password to reset it.']
${Delay}          5s



*** Keywords ***
Open Browser to the Login_Page
    Open Browser    ${SiteUrl}    ${Browser}
    Maximize Browser window

Enter User Name
    Input Text    id=identifierId   ${Username1}

Click Next
    Click Element     xpath=//div[@role = 'button' and @id='identifierNext']

Enter Password
    Input Password    xpath=//div[@id='password']//input[@type='password']   ${Password1}

Click Login
    Click Element   id=passwordNext

Assert Error Message
     should be equal as strings  ${response1}       ${DashboardTitle1}

Close Browser
    Close All Browsers



