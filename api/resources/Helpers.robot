*** Settings ***
Documentation        Aqui teremos as KWs de ajuda
Library    OperatingSystem

*** Keywords ***
Obter Json
    [Arguments]   ${route}        ${file_name}
    ${fixture}    Get File        ${CURDIR}/fixtures/${route}/${file_name}
    ${json}       Evaluate        json.loads($fixture)
    [Return]      ${json}