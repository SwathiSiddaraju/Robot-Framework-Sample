*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Resource          Login_page.robot
#Resource            Invalid_login.robot


*** Test Cases ***

LoginTest
    Open Browser to the Login Page
    Enter User Name
    Click Next
    sleep    ${Delay}
    Enter Password
    Click Login
    sleep    ${Delay}
    log to console        The text is ${response}
#    Assert Error Message
    [Teardown]   Close Browser

Invalid_login
    Open Browser to the Login Page
    Enter User Name
    Click Next
    sleep    ${Delay}
    Enter Password
    Click Login
    sleep    ${Delay}
#    Assert Error Message
    [Teardown]   Close Browser