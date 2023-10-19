*** Settings ***
Library    selenium.webdriver.common.actions.pointer_actions.PointerActions
Library    SeleniumLibrary
Library    BuiltIn
Library    selenium.webdriver.common.actions.key_actions.KeyActions
Library    selenium.webdriver.common.bidi.cdp

Suite Setup    Log    I am inside Test Suite Setup
Suite Teardown    Log    I am inside TestSuite Teardown
Test Setup    Log    I am inside Test Setup
Test Teardown    Log    I am inside Test Teardown      

Default Tags    Sanity  

*** Test Cases ***
MyFirstTest
    [Tags]    Smoke
   Log   Hello World    
   
OpenBrowserAndSearch
   
    [Documentation]    Open the browser and search
    Open Browser    ${GOOGLEURL}    chrome
    Maximize Browser Window
    Click Element    xpath=//textarea[@type='search']
    Send Keys    Google
    Press Keys    xpath=//textarea[@type='search']    ENTER
    Close Browser
    Log    Test completed 
    Log    This testcase was executed by %{username} on %{os}
    
   
SampleLoginTest
    
    [Documentation]    This is a sample login test
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@name='username']     
    LoginKeyWord
    Wait Until Element Is Visible    xpath=//i[@class='oxd-icon bi-caret-down-fill oxd-userdropdown-icon']     
    Click Element    xpath=//i[@class='oxd-icon bi-caret-down-fill oxd-userdropdown-icon'] 
    Click Element    xpath=//a[@href='/web/index.php/auth/logout']    
    Close Browser
    Log    Test completed 
    Log    This testcase was executed by %{username} on %{os}
   
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login  
${GOOGLEURL}    https://www.google.com
@{CREDENTAILS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKeyWord
    Input Text    xpath=//input[@name='username']    ${CREDENTAILS}[0]
    Input Password    xpath=//input[@name='password']     &{LOGINDATA}[password]
    Click Button    xpath=//button[@type='submit']