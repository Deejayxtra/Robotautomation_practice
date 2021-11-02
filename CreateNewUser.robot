*** Settings ***
Documentation    User should be able to create account
Library           SeleniumLibrary
Resource          Training_Resources.robot

*** Test Cases ***
Create New User Account
    Navigate To Homepage And Click Sign In
    Enter Email To Create User And Click The Create Account Button
    Provide All Required Info To Create New User And Click Register
    page should contain  ${LOGGED_IN_USER}