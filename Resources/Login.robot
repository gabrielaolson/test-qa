*** Settings ***

Library        Browser
Library        BuiltIn

*** Variables ***
${seuBarriga_text_login}         xpath=//a[text()='Login']
${input_email}                   input#email.form-control
${input_password}                input#senha.form-control
${button_enter}                  css=.btn-primary
${welcome_page}                  css=.alert-success

*** Keywords ***
Open browser 
  [Arguments]                ${START_URL}      
  New Browser                headless=false
  New Page                   ${START_URL}   

Login
  [Arguments]                ${email}    ${password}
  Wait For Elements State    ${seuBarriga_text_login}    visible
  Click                      ${seuBarriga_text_login}   
  ${text_login}              Get Text         ${seuBarriga_text_login}
  Should Be Equal            ${text_login}     Login 
  Fill Text                  ${input_email}    ${email}
  Fill Text                  ${input_password}    ${password}  
  Click                      ${button_enter} 
  Wait For Elements State    ${welcome_page}       visible
  ${welcome_text}            Get Text        ${welcome_page}    
  Should Contain             ${welcome_text}    Bem vindo
