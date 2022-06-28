*** Settings ***
Documentation    Arquivo para mapeamento de elemento da tela de login

Resource         ../../resources/base.robot
 
*** Variables ***
${TITULO_LOGIN}       xpath://p[contains(.,"Faça parte da maior comunidade de aluguel de equipamentos musicais!")]

${CAMPO_EMAIL}        id:user_email 
${CAMPO_SENHA}        id:user_password
${BTN_ENTRAR}         xpath://button[contains(.,"Entrar")]

${ALERT_LOGIN}        xpath://div[@class="alert alert-dark"]

*** Keywords ***
Login Com
    [Arguments]       ${email}            ${senha}
    Wait Until Element Is Visible    ${TITULO_LOGIN}    timeout=15

    Input Text        ${CAMPO_EMAIL}      ${email}    
    Input Password    ${CAMPO_SENHA}      ${senha}
    Click Button      ${BTN_ENTRAR}

Tentar Login Com
    [Arguments]    ${email}     ${senha}    ${erro}
    Login Com                        ${email}         ${senha}
    Wait Until Element Is Visible    ${ALERT_LOGIN} 
    Element Text Should Be           ${ALERT_LOGIN}   ${erro}