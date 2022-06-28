*** Settings ***
Resource    ../resources/pages/LoginPage.robot
Resource    ../resources/pages/DashboardPage.robot

Test Setup        Abrir navegador
Test Teardown     Fechar Navegador

*** Test Cases ***
Cenário 01: Login com sucesso
    Login Com    thiagofelipesc@gmail.com    pwd123
    Conferir Se Está Logado

Cenário 02: Tentar logar com senha incorreta
    Tentar Login Com    thiagofelipesc@gmail.com    incorrect    Usuário e/ou senha inválidos.

Cenário 03: Tentar logar com email não cadastrado
    Tentar Login Com    nãocadastrado@gmail.com   pwd123       Usuário e/ou senha inválidos.

Cenário 04: Tentar logar com email errado
    Tentar Login Com    thiagofelipe$$gmail.com   pwd123       Oops. Informe um email válido!

Cenário 05: Tentar logar sem informar email
    Tentar Login Com    ${EMPTY}                  pwd123       Oops. Informe um email válido!
    
Cenário 06: Tentar logar sem informar senha
    Tentar Login Com    thiagofelipesc@gmail.com    ${EMPTY}     Oops. Informe sua senha secreta!
