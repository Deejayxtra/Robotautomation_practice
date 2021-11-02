*** Settings ***
Documentation     Checking Login Functionalities
Suite Setup       Navigate To Homepage And Click Sign In
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          Training_Resources.robot




*** Test Cases ***
Valid login
    [Tags]  Deji
    [Setup]    Navigate To Homepage And Click Sign In
    #Open Browser    http://automationpractice.com/index.php    chrome
    #Maximize Browser Window
    #Click Element    class:login
    #Wait Until Element Is Visible    ${LOGIN_EMAIL_FIELD}    ${MAXIMUM_WAIT}
    #Input Text    ${LOGIN_EMAIL_FIELD}  ${VALID_USEREMAIL}
    #Wait Until Element Is Visible    ${PASSWORD_FIELD}    ${MAXIMUM_WAIT}
    #Input Password    ${PASSWORD_FIELD}     ${VALID_USERPASSWORD}
    #Click Element    ${LOGIN_BUTTON}
    Login User  ${VALID_USEREMAIL}  ${VALID_USERPASSWORD}
    Wait Until Page Contains    ${LOGGED_IN_USER}
    #[Teardown]    Close Browser

Invalid login1
    [Setup]    Navigate To Homepage And Click Sign In
    #Open Browser    http://automationpractice.com/index.php    chrome
    #Maximize Browser Window
    #Click Element    class:login
    Wait Until Element Is Visible    ${LOGIN_EMAIL_FIELD}    ${MAXIMUM_WAIT}
    Input Text    id:email    lanreikuesan@gmail.com
    Input Password    id:passwd    testing
    Click Element    id:SubmitLogin
    Page Should Not Contain    femi Paul
    #[Teardown]    Close Browser

Invalid login2
    [Setup]    Navigate To Homepage And Click Sign In
    #Open Browser    http://automationpractice.com/index.php    chrome
    #Maximize Browser Window
    #Click Element    class:login
    Wait Until Element Is Visible    id:email    10s
    Input Text    id:email    lanre.ikuesan@gmail.com
    Input Password    id:passwd    test
    Click Element    id:SubmitLogin
    Page Should Not Contain    femi Paul
    #[Teardown]    Close Browser

Invalid login3
    [Tags]  Ayo
    [Template]    Invalid Login Credentials should return the right Error Message
    lanre.ikuesan@gmail.com    test    Invalid password.
    lanreikuesan@gmail.com    testing    Authentication failed.
     ${EMPTY}    ${EMPTY}    An email address required.

*** Keywords ***
Invalid Login Credentials should return the right Error Message
    [Arguments]    ${Email}    ${Password}    ${ErrorMessage}
    #Open Browser    http://automationpractice.com/index.php    chrome
    #Maximize Browser Window
    #Click Element    class:login
    Navigate To Homepage And Click Sign In
    Wait Until Element Is Visible    ${LOGIN_EMAIL_FIELD}     ${MAXIMUM_WAIT}
    Input Text    id:email     ${Email}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    ${MAXIMUM_WAIT}
    Input Password    id:passwd    ${Password}
    Click Element    ${LOGIN_BUTTON}
    Page Should Contain    ${ErrorMessage}
    #[Teardown]    Close Browser


