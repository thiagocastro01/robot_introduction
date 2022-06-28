*** settings ***
Documentation    O arquivo faz ...
Library          FakerLibrary

*** Variables ***
${variavel_simples}    isso é uma variável simples
@{lista}               thiago    victor    moises    marcelo    pedro    carlos    claudio    felipe    joao    junior
&{dicionario}          nome=Carlos    idade=28    cargo=Analista    salario=7000

*** Test Cases ***
Iniciando em robot
    Sorteando um nome aleatório na lista
    Printando infos do dicionario
    
*** Keywords ***
Sorteando um nome aleatório na lista
    ${num_sorteado}=    Random Number    digits=1    fix_len=true
    FOR    ${index}    ${pessoa}    IN ENUMERATE    @{lista}
        IF    ${index} == ${num_sorteado}
            Log To Console    O sorteado foi ${pessoa}, parabens!!
        END
    END

Printando infos do dicionario
    Log To Console    \nNome do funcionario: ${dicionario.nome}\nIdade do funcionario: ${dicionario.idade}\nCargo do funcionario: ${dicionario.cargo}\nSalario do funcionario: ${dicionario.salario}\n