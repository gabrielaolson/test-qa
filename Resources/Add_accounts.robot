

*** Settings ***

Library        Browser
Library        BuiltIn

*** Variables ***
${add_bills}                     css=a.dropdown-toggle  
${add_option}                    xpath=//a[text()='Adicionar']
${input_name_bill}               input#nome.form-control
${save_button}                   css=.btn-group>.btn:first-child

*** Keywords ***
Add Account Expenses
  [Arguments]                ${expense_title}
  Click                      ${add_bills} 
  Click                      ${add_option}  
  Fill Text                  ${input_name_bill}     ${expense_title}
  Click                      ${save_button}   

Add Account Revenues
  [Arguments]                ${revenue_title}
  Click                      ${add_bills} 
  Click                      ${add_option}  
  Fill Text                  ${input_name_bill}     ${revenue_title}
  Click                      ${save_button}   
