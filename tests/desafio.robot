*** Settings ***
Library  RequestsLibrary

*** Variables ***
${URL}    https://baconipsum.com/

*** Test Cases ***
#Deve ser possível ao usuário informar quantos parágrafos de texto ele deseja gerar.
#Caso nenhum valor for informado, o sistema deve gerar somente um parágrafo por padrão;
#O volume máximo de texto gerado deve ser de 99 parágrafos;
#O usuário poderá escolher se o texto será iniciado com "Bacon ipsum dolor amet...".

Scenario 01: Teste bacon ipsum Method GET
    ${RESPONSE} =        GET  ${URL}     params=paras=0  expected_status=200
    Log To Console    ${RESPONSE}

Scenario 02: Teste bacon ipsum Method GET zero paragrafos
    ${RESPONSE} =        GET  ${URL}  params=paras=0  expected_status=200
    Log To Console    ${RESPONSE}

Scenario 03: Teste bacon ipsum Method GET mais que 99 paragrafos
    ${RESPONSE} =        GET  ${URL}  params=paras=100  expected_status=200
    Log To Console    ${RESPONSE}

Scenario 04: Teste bacon ipsum Method GET inicio com Bacon ipsum dolor amet
    ${RESPONSE }=        GET  ${URL}  params=paras=0  params=start-with-lorem=1  expected_status=200
    Log To Console    ${RESPONSE }