*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}            chrome
${URL}                https://docs.google.com/forms/d/e/1FAIpQLSf_0J1wuCoWHZKz9O6pzkSk89KCrq6Ydy37rkJUJ_LR_I-rqA/viewform
# ${URL}                https://forms.gle/4uXqWTQv9cMQHMN27
${Input_name}         aria-labelledby:i5
${Input_idade}        aria-labelledby:i1
${Input_cidade}       aria-labelledby:i9
${Button}             aria-label:Submit

*** Keywords ***
abrir forms;
    Open Browser    url=${URL}    browser=${BROWSER}
    Close Browser

preencher campos;
    Input Text    ${Input_name}        João
    Input Text    ${Input_idade}       20
    Input Text    ${Input_cidade}      Belo Horizonte

clicar em enviar;
    Click Element    ${Button}

fechar forms;
    Close Browser