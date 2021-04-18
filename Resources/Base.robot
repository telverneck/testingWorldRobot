*** Settings
Library         SeleniumLibrary
Library         FakerLibrary

Resource        Hooks.robot
Resource        Pages/firstPage.robot


*** Variables
${BROWSER}              Headless Chrome
${BASE_URL}             http://www.thetestingworld.com/testings
${WIDTH}                1440               
${HEIGHT}               900
${TIMEOUT}              15 seconds
${LONG_TIMEOUT}         30 seconds
