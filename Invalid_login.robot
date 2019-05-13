*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.



*** Settings ***
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


#    ${response}    Get Text    xpath=/html/body/div/tr[2]/td/strong
# Should Be Equal As Strings    ${response}    Payment was successful
