*** Settings ***
Documentation     A test suite with a two test for valid & invalid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.

Library           SeleniumLibrary
Resource          Invalid_login.robot
Resource            Login_page.robot

*** Test Cases ***

Invalid_logintest
    Invalid_login.Open Browser to the Login_Page
    Invalid_login.Enter User Name
    Invalid_login.Click Next
    sleep    ${Delay}
    Invalid_login.Enter Password
    Invalid_login.Click Login
    sleep    ${Delay}
#    Assert Error Message
    [Teardown]   Invalid_login.Close Browser

LoginTest
    Login_page.Open Browser to the Login Page
    Login_page.Enter User Name
    Login_page.Click Next
    sleep    ${Delay}
    Login_page.Enter Password
    Login_page.Click Login
    sleep    ${Delay}
#    log to console        The text is ${response1}
#    Assert Error Message
    [Teardown]   Login_page.Close Browser

