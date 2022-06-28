*** Settings ***
Documentation    Exemplo utilizando DDT

Resource        ../resources/Base.robot
Resource        ../resources/Helpers.robot

Test Template    Tentar Logar

*** Test Cases ***                    json_file                      status_code    message
Cenário 01: Senha incorreta           senha_incorreta.json           401            Unauthorized 
Cenário 02: Email não cadastrado      email_nao_cadastrado.json      401            Unauthorized
Cenário 03: Email errado              email_errado.json              412            wrong email
Cenário 04: Email vazio               email_vazio.json               412            required email 
Cenário 05: Senha vazia               senha_vazia.json               412            required password 
Cenário 07: Payload sem senha         payload_sem_senha.json         412            required password
Cenário 06: Payload sem email         payload_sem_email.json         412            required email 
Cenário 07: Payload sem senha         payload_sem_senha.json         412            required password

*** Keywords ***
Tentar Logar
    [Arguments]    ${json_file}    ${status_code}    ${error_msg}
    &{payload}     Obter Json      sessions    ${json_file}
    ${response}    POST Login    ${payload}
    
    Status Should Be    ${status_code}    ${response}
      
    Should Be Equal    ${error_msg}    ${response.json()}[error]