*** Settings ***
Resource        ../resources/Base.robot
Resource    ../resources/Helpers.robot

*** Test Cases ***
Cenário 01: Login com sucesso
    &{payload}     Obter Json    sessions    user_login.json

    ${response}    POST Login    ${payload}
    
    Status Should Be    200    ${response}

    ${token}    Set Variable    ${response.json()}[user_token]
    Length Should Be    ${token}    24
