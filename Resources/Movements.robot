*** Settings ***
Library        Browser
Library        BuiltIn

*** Variables ***
${navbar_create_movement}        xpath=//a[text()='Criar Movimentação']
${type_of_movement_text}         xpath=//label[text()='Tipo da Movimentação']
${select_type_of_movement}       select[name=tipo]
${input_payment_date}            input#data_pagamento.form-control
${input_transaction_date}        input#data_transacao.form-control
${input_description}             input#descricao.form-control
${input_interested}              input#interessado.form-control
${input_value}                   input#valor.form-control 
${select_account}                select[name=conta]
${input_radio_pending}           input#status_pendente
${button_save}                   css=button.btn.btn-primary
${input_radio_paid}              input#status_pago
${alert_success}                 div.alert.alert-success

*** Keywords ***
Set transaction date 
  [Arguments]                ${transaction_date} 
  Fill Text                  ${input_transaction_date}    ${transaction_date} 

Set payment date 
  [Arguments]                ${payment_date} 
  Fill Text                  ${input_payment_date}        ${payment_date} 

Set description 
  [Arguments]                ${description} 
  Fill Text                  ${input_description}         ${description} 

Set interested
  [Arguments]                ${interested} 
  Fill Text                  ${input_interested}         ${interested}  

Set value
  [Arguments]                ${value} 
  Fill Text                  ${input_value}         ${value} 

Create movement expense pending
  [Arguments]                
  Click                      ${navbar_create_movement} 
  Wait For Elements State    ${type_of_movement_text}  
  Select Options By          ${select_type_of_movement}    text    Despesa
  Set transaction date       23/10/2021
  Set payment date           23/11/2021
  Set description            Eletricity
  Set interested             Gabriela
  Set value                  200
  Wait For Elements State    ${select_account}    visible
  Select Options By          ${select_account}     text    General bills
  Click                      ${input_radio_pending}
  Click                      ${button_save}  
  Wait For Elements State    ${alert_success}     visible 

Create movement expense paid
  [Arguments]
  Click                      ${navbar_create_movement} 
  Wait For Elements State    ${type_of_movement_text}  
  Select Options By          ${select_type_of_movement}    text    Despesa
  Set transaction date       23/10/2021
  Set payment date           23/11/2021
  Set description            Rent
  Set interested             Gabriela
  Set value                  2000
  Wait For Elements State    ${select_account}    visible   
  Select Options By          ${select_account}     text    Home expenses
  Click                      ${input_radio_paid}
  Click                      ${button_save} 
  Wait For Elements State    ${alert_success}     visible 
  
Create movement revenue pending
  [Arguments]
  Click                      ${navbar_create_movement} 
  Wait For Elements State    ${type_of_movement_text}  
  Select Options By          ${select_type_of_movement}    text    Receita
  Set transaction date       23/10/2021
  Set payment date           23/11/2021
  Set description            Eletricity
  Set interested             Gabriela
  Set value                  200
  Wait For Elements State    ${select_account}    visible
  Select Options By          ${select_account}     text    Rent
  Click                      ${input_radio_pending}
  Click                      ${button_save}   
  Wait For Elements State    ${alert_success}     visible 

Create movement revenue paid
  [Arguments]
  Click                      ${navbar_create_movement} 
  Wait For Elements State    ${type_of_movement_text}  
  Select Options By          ${select_type_of_movement}    text    Receita
  Set transaction date       23/10/2021
  Set payment date           23/11/2021
  Set description            Other
  Set interested             Gabriela
  Set value                  1500
  Wait For Elements State    ${select_account}    visible
  Select Options By          ${select_account}     text    Other receipt
  Click                      ${input_radio_paid}
  Click                      ${button_save} 
  Wait For Elements State    ${alert_success}     visible 