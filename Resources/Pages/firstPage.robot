***Variables
${userNameText}                     name:fld_username 
${emailText}                        name:fld_email 
${passwordText}                     name:fld_password 
${passwordConfirmationText}         name:fld_cpassword  
${dateOfBithText}                   name:dob  
${phoneText}                        name:phone  
${addressText}                      name:address  
${addressHomeTypeRadio}             css:[value=home]  
${addressOfficeTypeRadio}           css:[value=office]   
${genderDropdown}                   name:sex  
${countryDropdown}                  name:country  
${stateDropdown}                    name:state  
${cityDropdown}                     name:city  
${zipcodeText}                      name:zip  
${termsCheck}                       name:terms 
${calendarIcon}                     css:i.fa-calendar-o
${addressTypeRadio}                 add_type
${alertSucess}                      class:alert-success
${signUpButton}                     css:input[value='Sign up']


***Keywords
Given that I am on "${page}" page
    ${url}=             Get Location
    Should contain      ${url}      ${page}

And I check the title "${pageTitle}"
    Title Should be     ${pageTitle}

And I have random data
    ${FAKERNAME}=           First Name
    ${FAKERLASTNAME}=       Last Name
    ${FAKEREMAIL}=          Free Email
    ${FAKERPASSWORD}=       Password	length=10
    ${FAKERDATEOFBIRTH}=    Date Of Birth          minimum_age=18
    ${FAKERPHONE}=          Phone Number
    ${FAKERADRESS}=         Street Address	
    ${FAKERZIP}=            Zipcode	
    Set Test Variable   &{DICT}     name=${FAKERNAME}  lastName=${FAKERLASTNAME}    email=${FAKEREMAIL}     password=${FAKERPASSWORD}
    ...     dateOfBirth=${FAKERDATEOFBIRTH}     phone=${FAKERPHONE}     address=${FAKERADRESS}      zipCode=${FAKERZIP}

When I submit my data
    
    Fill Registration Fields     ${DICT}[name]   ${DICT}[email]  ${DICT}[password]   ${DICT}[dateOfBirth]    
    ...     ${DICT}[phone]  ${DICT}[address]    home    Male    1   50  5940   ${DICT}[zipCode] 
    
    Select Checkbox                 ${termsCheck}  
    Checkbox Should Be Selected     ${termsCheck}       
    Capture Page Screenshot         #show that all fields are filled
    Click Button                    ${signUpButton} 


Then I must see the message "${message}"
    Wait Until Element Is Visible   ${alertSucess}      ${TIMEOUT}
    Element Should Contain          ${alertSucess}      ${message}

Fill Registration Fields
    [Arguments]     ${name}   ${email}  ${password}    ${dateOfBirth}    
    ...     ${phone}  ${address}    ${addressType}    ${gender}    ${country}   ${state}   ${city}    ${zipCode} 
    Input Text                              ${userNameText}                  ${name}
    Input Text                              ${emailText}                     ${email}
    Input Text                              ${passwordText}                  ${password}
    Input Text                              ${passwordConfirmationText}      ${password}
    Input Text                              ${dateOfBithText}                ${dateOfBirth}
    Press Keys                              ${calendarIcon}                  Tab
    Input Text                              ${phoneText}                     ${phone}
    Input Text                              ${addressText}                   ${address}
    Select Radio Button                     ${addressTypeRadio}              ${addressType}                 
    Select From List By Label               ${genderDropdown}                ${gender}
    Select From List By Index               ${countryDropdown}               ${country}
    Wait Until Element Does Not Contain     ${stateDropdown}                 Please wait for 3 seconds      ${TIMEOUT}
    Select From List By Value               ${stateDropdown}                 ${state}
    Select From List By Value               ${cityDropdown}                  ${city}
    Input Text                              ${zipcodeText}                   ${zipCode}
    