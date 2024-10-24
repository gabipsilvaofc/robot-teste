*** Settings ***
Library    SeleniumLibrary
Documentation    Teste Forms

*** Variables ***
${BROWSER}                Chrome
${URL}                    http://127.0.0.1:5500/index.html
${Input_name}             id:username
${Input_senha}            id:password
${Input_confirm_senha}    id:password-confirmation
${Button}                 id:alerta

*** Keywords ***
abrir navegador
    Open Browser    url=${URL}    browser=${BROWSER}

preencher campos
    Input Text    ${Input_name}             Gabi
    Input Text    ${Input_senha}            gabi123
    Input Text    ${Input_confirm_senha}    gabi123

clicar em enviar
    Click Element    ${Button}

# fechar forms;
#     Close Browser

*** Test Cases ***
Caso de Exemplo
    abrir navegador
    preencher campos
    clicar em enviar
    #fechar forms