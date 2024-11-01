*** Settings ***
Library    SeleniumLibrary
Library    String
Documentation    Teste senai

*** Variables ***
${url}                https://ava.sesisenai.org.br/login/index.php
${Browser}            chrome
${Input_user}         id:username
${Input_senha}        id:password
${Button}             id:loginbtn
${Button-menu}        id:user-menu-toggle
${text_home}          Menu

*** Keywords ***
abrir navegador
    Open Browser    ${url}    ${Browser}
    Sleep           5s

preencher campos
    Input Text        ${Input_user}     username123
    Input Password    ${Input_senha}    senhaqualquer

clicar em enviar
    Click Button    ${Button}
    Sleep    3s
confirmar sucesso no login
    # ${h2_home}=    Get Text    ${text_home}
    # ${h2_home}=    Strip String    ${h2_home}
    Should Be Equal    ${text_home}      Menu 


*** Test Cases ***
Teste login
    abrir navegador
    preencher campos
    clicar em enviar
    confirmar sucesso no login

# Teste de logout
#     clicar em perfil
#     clicar em sair
