*** Settings ***
Resource         ../Resources/Signup.robot
Resource         ../Resources/Login.robot
Resource         ../Resources/Movements.robot
Resource         ../Resources/Add_accounts.robot


*** Variables ***
${START_URL}      https://seubarriga.wcaquino.me/login
${user_name}      Gabriela Olson
${email}          gabiol+211224@gmail.com
${password}       @123456


*** Test Cases ***
Create movements
  Open browser                      ${START_URL} 
  Sign up                           ${user_name}    ${email}    ${password}
  Login                             ${email}    ${password}
  Add Account Expenses              General bills
  Add Account Expenses              Home expenses
  Add Account Revenues              Rent
  Add Account Revenues              Other receipt
  Wait Until Keyword Succeeds  2x  10s    Create movement expense pending
  Wait Until Keyword Succeeds  2x  10s    Create movement expense paid
  Wait Until Keyword Succeeds  2x  10s    Create movement revenue pending  
  Wait Until Keyword Succeeds  2x  10s    Create movement revenue paid
