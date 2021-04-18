***Settings
Documentation       Check for New users
Resource            ../Resources/base.robot 

Test Setup          Start Session
Test Teardown       Finish Session
Test Timeout        20s


***Test Cases
Scenario1: Register a new user
    [Documentation]     This Scenario will check new users registration
    Given that I am on "testings" page
    And I check the title "Login & Sign Up Forms"
    And I have random data
    When I submit my data
    Then I must see the message "User is successfully Register. Now You can Login"
