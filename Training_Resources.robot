*** Settings ***
Documentation     Variables and Keywords for Automation Practice Project
Library           SeleniumLibrary
Library           FakerLibrary


*** Variables ***
${URL}  http://automationpractice.com/index.php
${BROWSER}                      chrome      #headlesschrome
${LOGIN_EMAIL_FIELD}            id:email
${VALID_USEREMAIL}              lanre.ikuesan@gmail.com
${PASSWORD_FIELD}               id:passwd
${CREATE_EMAIL_FIELD}           name:email_create
${CREATE_ACCOUNT_BUTTON}        xpath://*[@id="SubmitCreate"]/span
${GENDER_BUTTON}                id:id_gender1
${FIRSTNAME}                    name:customer_firstname
${LASTNAME}                     id:customer_lastname
${PASSWORD}                     name:passwd
${DOB_DAYS}                     id:days
${DOB_MONTHS}                   id:months
${DOB_YEARS}                    id:years
${ADDRESS}                      name:address1
${CITY}                         name:city
${STATE}                        id:id_state
${POSTCODE}                     name:postcode
${PHONE_NUMBER}                 name:phone_mobile
${ALIAS}                        name:alias
${REGISTER_BUTTON}              xpath://span[text() = 'Register']
${VALID_USERPASSWORD}           testing
${LOGIN_BUTTON}                 id:SubmitLogin
${LOGGED_IN_USER}               Femi Paul
${SIGNIN_BUTTON}                class:login
${MAXIMUM_WAIT}                 10S


*** Keywords ***
Navigate To Homepage And Click Sign In
    Open Browser    ${URL}     ${BROWSER}
    Maximize Browser Window
    Click Element    ${SIGNIN_BUTTON}

Login User
    [Arguments]  ${username}    ${password}
    wait until element is visible   ${LOGIN_EMAIL_FIELD}
    input text  ${LOGIN_EMAIL_FIELD}    ${username}
    input text  ${PASSWORD_FIELD}   ${password}
    Click Element    ${LOGIN_BUTTON}

Enter Email To Create User And Click The Create Account Button
    ${email} =  FakerLibrary.email
    log  ${email}
    set Test Variable  ${email}
    wait until element is visible   ${CREATE_EMAIL_FIELD}
    input text  ${CREATE_EMAIL_FIELD}   ${email}
    wait until element is visible   ${CREATE_ACCOUNT_BUTTON}
    click element   ${CREATE_ACCOUNT_BUTTON}

Provide All Required Info To Create New User And Click Register
    Sleep  3
    click element   ${GENDER_BUTTON}
    wait until element is visible   ${FIRSTNAME}
    input text  ${FIRSTNAME}    Femi
    input text  ${LASTNAME}     Paul
    input text  ${PASSWORD}     testing
    click element   ${DOB_DAYS}
    select from list by index  ${DOB_DAYS}  25
    click element   ${DOB_MONTHS}
    select from list by index   ${DOB_MONTHS}  12
    click element   ${DOB_YEARS}
    select from list by value   ${DOB_YEARS}    1990
    input text  ${ADDRESS}  111B Testing Headquarters
    input text  ${CITY}     Chicago
    click element   ${STATE}
    select from list by index     ${STATE}  15
    input text   ${POSTCODE}     00000
    input text   ${PHONE_NUMBER}    1234567890
    input text   ${ALIAS}   Test Building
    click element   ${REGISTER_BUTTON}
