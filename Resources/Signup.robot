*** Settings ***

Library        Browser
Library        BuiltIn


***Variables***

${seuBarriga_text_new_user}      xpath=//a[text()='Novo usuário?']
${input_name}                    input#nome.form-control
${input_email}                   input#email.form-control
${input_password}                input#senha.form-control
${input_submit_register}         input.btn.btn-primary
${user_name}                     test

*** Keywords ***


Sign up
  [Arguments]                ${user_name}    ${email}    ${password} 
  Click                      ${seuBarriga_text_new_user}   
  Wait For Elements State    ${seuBarriga_text_new_user}      visible
  ${text_login}              Get Text          ${seuBarriga_text_new_user}  
  Should Be Equal            ${text_login}     Novo usuário? 
  Fill Text                  ${input_name}        ${user_name} 
  Fill Text                  ${input_email}    ${email}
  Fill Text                  ${input_password}    ${password} 
  Click                      ${input_submit_register}  


