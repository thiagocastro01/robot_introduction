*** Settings ***
Documentation    Arquivo para mapeamento de elemento e ações da tela de Dashboard

Resource             ../../resources/base.robot

*** Variables ***
${MENU_DASH}         xpath://div[@class="dashboard"]        

*** Keywords ***
Conferir Se Está Logado
    Wait Until Element Is Visible    ${MENU_DASH} 
    Element Should Be Visible        ${MENU_DASH} 