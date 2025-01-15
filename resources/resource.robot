*** Settings ***
Resource    ../config/settings.robot
Resource    ../resources/variables.robot

*** Keywords ***

Teste de Login
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    sleep  5s
    Input Text        ${input_user}     system
    Input Password    ${input_senha}    Admin123
    Click Button      ${Button}
    Sleep    4s
    ${h1_text}=    Get Text       ${text_home}
    Should Be Equal As Strings    ${h1_text}    HOME
abrir navegador
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
preencher campos
    Input Text        ${input_user}     system
    Input Password    ${input_senha}    Admin123
preencher campos com informação errada
    Input Text        ${input_user}     system
    Input Password    ${input_senha}    Admin
clicar em enviar
    Click Button    ${Button}
conferir o login
    ${h1_text}=    Get Text       ${text_home}
    Should Be Equal As Strings    ${h1_text}    HOME

conferir o aviso de erro
    Element Text Should Be    ${element}    credenciais inválidas

Teste de Logout
    Wait Until Element Is Visible    ${img_logout}
    Click Element                    ${img_logout}

clicar em sair
    Wait Until Element Is Visible    ${img_logout}
    Click Element                    ${img_logout}

confirmar logout
    ${h1_text}=    Get Text       ${text_home}
    Should Be Equal As Strings    ${h1_text}    Boas-vindas!
    Location Should Be            ${page_login}

Entrar na pagina de Centrais
    sleep  2s
    Mouse Over                       ${button-central-incendio}
    Wait Until Element Is Visible    ${button-central-incendio}
    Click Element                    ${button-central-incendio}
    Wait Until Page Contains         Centrais de incêndio 
    Sleep                            3s

levar o cursor ate a barra lateral
    Mouse Over        ${button-central-incendio}
    Sleep    2s

clicar em 'Centrais de incêndio'
    Click Element    ${button-central-incendio}


conferir se entrou na pagina
    Wait Until Page Contains    Centrais de incêndio
    Sleep    3s

clicar em 'nova central'

    Click Element    ${Button-nova-central}
    Sleep    3s

preencher os campos
    Sleep    2s
    Input Text              ${input-nome-central}     teste robot
    Click Button            ${input-modelo-central}
    Click Button            ${Button-select-modelo}
    Input Text              ${input-MAC}              12:31:23:12:31:33

salvar informações da central
    Click Button    ${Button-salvar-central}
    Sleep           5s

pesquisar central
    Input Text       ${search-central}        teste robot
    Press Key        ${search-central}        \\13
    Sleep            2s
confirmar se a central foi criada
    ${nome-central}=    Get Text       ${text_central}
    Should Be Equal As Strings         ${nome-central}    teste robot
    Sleep                              3s

clicar no checkbox da central
    Click Element    ${checkbox-central-search}

clicar na lixeira da central
    Click Element    ${element-lixeira}
    Sleep            3s
clicar em confirmar
    Click Button     ${button-confirmar-exclusao}
    Sleep            3s

confirmar se a central foi excluida
    Wait Until Element Contains    ${alert-central-excluida}    Centrais excluídas com sucesso

preencher os campos modelo e MAC
    Click Button            ${input-modelo-central}
    Click Button            ${Button-select-modelo}
    Input Text              ${input-MAC}              12:31:23:12:31:23

verificar mensagem de erro de central sem nome
    Wait Until Page Contains    O nome deve ser preenchido

preencher os campos nome e modelo
    Input Text              ${input-nome-central}     teste robot
    Click Button            ${input-modelo-central}
    Click Button            ${Button-select-modelo}

verificar mensagem de erro de central sem MAC
    Wait Until Page Contains    O MAC deve ser preenchido    

preencher os campos nome e MAC
    Input Text              ${input-nome-central}     teste robot    
    Input Text              ${input-MAC}              12:31:23:12:31:23    

verificar mensagem de erro de central sem modelo
    Wait Until Page Contains    Selecione um modelo

preencher os campos com MAC repetido
    Wait Until Element Is Visible    ${input-nome-central}
    Input Text                       ${input-nome-central}     teste robot
    Click Button                     ${input-modelo-central}
    Click Button                     ${Button-select-modelo}
    Input Text                       ${input-MAC}              12:31:23:12:31:23 
# deve ser um MAC repetido / já cadastrado

verificar mensagem de erro de central com MAC repetido
    Wait Until Page Contains    MAC já cadastrado

preencher os campos com MAC inválido
    Input Text              ${input-nome-central}     teste robot
    Click Button            ${input-modelo-central}
    Click Button            ${Button-select-modelo}
    Input Text              ${input-MAC}              12:31:23:12:31:2P

verificar mensagem de erro de central com MAC inválido
    Wait Until Page Contains    O valor informado não é um endereço MAC válido

# Testes de centrais de alarme
Entrar na pagina de Centrais de alarme
    Mouse Over                        ${button-central-alarme}
    Sleep             2s
    Wait Until Element Is Visible     ${central-alarme}
    Sleep    2s
    Click Element                     ${central-alarme}
    Wait until element is visible     ${button-central-particao-zona}
    Click Element                     ${button-central-particao-zona}
    Sleep            3s 
    ${url-central-alarme}=    Get Location
    Should Be Equal    ${url-central-alarme}    http://10.100.61.145:11080/central-alarme
    Sleep              3s


levar o cursor ate a barra lateral alarme
    Mouse Over        ${button-central-alarme}
    Sleep             2s

clicar em 'Centrais de alarme' condicional
    ${visible}    Run Keyword And Return Status    Element Should Be Visible    ${button-central-particao-zona}
    Run Keyword If    ${visible}    clicar em 'Central, partição e zonas'    ELSE    clicar em 'Centrais de alarme'

clicar em 'Centrais de alarme'
    Wait Until Element Is Visible    ${central-alarme}
    Click Element        ${central-alarme}
    Sleep    5s

clicar em 'Central, partição e zonas' condicional
    ${visible}    Run Keyword And Return Status    Element Should Be Visible    ${button-central-particao-zona}
    Run Keyword If    ${visible}    clicar em 'Central, partição e zonas'    ELSE    clicar em 'Centrais de alarme'

clicar em 'Central, partição e zonas'
    Wait Until Element Is Visible     ${button-central-particao-zona}
    Mouse Over                        ${button-central-particao-zona}
    Click Element                     ${button-central-particao-zona}
    Sleep                             3s

conferir pagina de centrais de alarme
    ${url-central-alarme}=    Get Location
    Should Be Equal    ${url-central-alarme}    http://10.100.61.145:11080/central-alarme
    Sleep              3s
    
clicar em 'nova central' alarme
    Wait Until Element Is Visible    ${button-create-central-alarme}
    Click Button                     ${button-create-central-alarme}
    Sleep                            3s    

confirmar se entra na pagina de cadastro de central de alarme
    Wait Until Page Contains    Nova Central de Alarme

cancelar cadastro de central de alarme
    Click Element    ${button-cancelar-cadastrado}

preencher os campos alarme
    Input Text              ${input-nome-central-alarme}       teste robot
    Click Button            ${input-modelo-central-alarme}
    Click Button            ${Button-select-modelo-alarme}
    Input Text              ${input-MAC-alarme}                 12:31:23:12:31:23
    Input Password          ${input-password-central-alarme}    878787
    Sleep                   2s

salvar infos da central alarme
    Click Button            ${button-salvar-central-alarme}

verificar sucesso da central alarme
    Wait Until Page Contains    Central criada
    Sleep                       5s
    Click Element     ${search-alarme}
    Input Text        ${search-alarme}        teste robot
    Press Key         ${search-alarme}        \\13
    Sleep             2s
    ${text-central-alarme}=    Get Text       ${nome-central-alarme}
    Should Be Equal As Strings                ${text-central-alarme}    teste robot
    Sleep                        3s

preencher os campos alarme sem nome
    Click Button            ${input-modelo-central-alarme}
    Click Button            ${Button-select-modelo-alarme}
    Input Text              ${input-MAC-alarme}                 12:31:23:12:31:23
    Input Password          ${input-password-central-alarme}    878787
    Sleep                   2s

verificar alerta de erro nome da central alarme
    Wait Until Page Contains    O nome da central deve ser preenchido
    Sleep                       3s

preencher os campos alarme sem MAC
    Input Text              ${input-nome-central-alarme}        teste robot
    Click Button            ${input-modelo-central-alarme}
    Click Button            ${Button-select-modelo-alarme}
    Input Password          ${input-password-central-alarme}    878787
    Sleep                   2s

verificar alerta de erro sem MAC da central alarme
    Wait Until Page Contains    O MAC deve ser preenchido
    Sleep                       3s

preencher os campos alarme sem modelo
    Input Text              ${input-nome-central-alarme}        teste robot
    Input Text              ${input-MAC-alarme}                 12:31:23:12:31:23
    Input Password          ${input-password-central-alarme}    878787
    Sleep                   2s

verificar alerta de erro modelo da central alarme
    Wait Until Page Contains    Selecione um modelo
    Sleep                       3s

preencher os campos alarme sem senha
    Input Text              ${input-nome-central-alarme}        teste robot
    Click Button            ${input-modelo-central-alarme}
    Click Button            ${Button-select-modelo-alarme}
    Input Text              ${input-MAC-alarme}                 12:31:23:12:31:23
    Sleep                   2s

verificar alerta de erro senha da central alarme
    Wait Until Page Contains    A senha deve ser preenchida
    Sleep                       3s

preencher os campos alarme com MAC inválido
    Input Text              ${input-nome-central-alarme}        teste robot
    Click Button            ${input-modelo-central-alarme}
    Click Button            ${Button-select-modelo-alarme}
    Input Text              ${input-MAC-alarme}                 12:31:p3:12:31:23
    Input Password          ${input-password-central-alarme}    878787
    Sleep                   2s

verificar alerta de erro MAC inválido da central alarme
    Wait Until Page Contains    O valor informado não é um endereço MAC válido
    Sleep                       3s

preencher os campos alarme com letra na senha
    Input Text              ${input-nome-central-alarme}        teste robot
    Click Button            ${input-modelo-central-alarme}
    Click Button            ${Button-select-modelo-alarme}
    Input Text              ${input-MAC-alarme}                 12:31:23:12:31:23
    Input Password          ${input-password-central-alarme}    878a87
    Sleep                   2s

verificar alerta de erro senha com letra da central alarme
    Wait Until Page Contains    A senha deve conter 6 digitos
    Sleep                       3s
preencher os campos alarme com MAC repetido
    Input Text              ${input-nome-central-alarme}        teste robot
    Click Button            ${input-modelo-central-alarme}
    Click Button            ${Button-select-modelo-alarme}
    Input Text              ${input-MAC-alarme}                 12:31:23:12:31:23
    Input Password          ${input-password-central-alarme}    878787
    Sleep                   2s

verificar alerta de erro MAC repetido da central alarme
    Wait Until Page Contains    Request failed with status code 301
    Sleep                       3s

pesquisar central pelo nome
    Click Element     ${search-alarme}
    Input Text        ${search-alarme}        teste robot
    Press Key         ${search-alarme}        \\13
    Sleep             2s
    ${text-name-central-alarme}=    Get Text       ${nome-central-alarme}
    Should Be Equal As Strings                ${text-name-central-alarme}    teste robot
    Sleep                              3s

selecionar central e clicar na lixeira
    Click Element                    ${checkbox-central-alarme}
    Wait Until Element Is Visible    ${lixeira-central-alarme}
    Click Element                    ${lixeira-central-alarme}
    Wait Until Element Is Visible    ${button-confirmar-exclusao}
    Click Button                     ${button-confirmar-exclusao}
    Sleep                            3s
verificar se a central foi excluida com sucesso
    Wait Until Page Contains    Centrais excluídas com sucesso
    Sleep                       3s

clicar em 'Templates'
    Wait Until Element Is Visible    ${button-templates}
    Mouse Over                       ${button-templates}
    Click Element                    ${button-templates}

clicar em 'Novo template'
    Wait Until Element Is Visible    ${button-new-templates}
    Click Element                    ${button-new-templates}

preencher o campo nome evento
    Wait Until Element Is Visible    ${input-nome-evento}
    Input Text                       ${input-nome-evento}    teste robot
selecinar itens e zonas
    Wait Until Element Is Visible    ${button-abrir-zonas}
    # abre
    Click Element                    ${button-abrir-zonas}
    # fecha
    Click Element                    ${button-abrir-zonas}

selecionar usuarios
    Wait Until Element Is Visible    ${button-abrir-usuarios}
    Click Element                    ${button-abrir-usuarios}
    Click Element                    ${button-abrir-usuarios}
    
salecionar sistemas
    Wait Until Element Is Visible    ${button-abrir-sistemas}
    Click Element                    ${button-abrir-sistemas}
    Click Element                    ${button-abrir-sistemas}
    
    
salvar template
    Wait Until Element Is Visible    ${button-salvar-template}
    Click Button                     ${button-salvar-template}

verificar sucesso do template
    Wait Until Page Contains           Templates de eventos
    Click Element                      ${search-template}
    Input Text                         ${search-template}        teste robot
    Press Key                          ${search-template}        \\13
    Wait Until Element Is Visible      ${nome-template}
    ${text-template}=    Get Text      ${nome-template}
    Should Be Equal As Strings         ${text-template}          teste robot
    Sleep                              5s

selecionar o template
    Wait Until Element Is Visible      ${search-template}
    Click Element                      ${search-template}
    Input Text                         ${search-template}        teste robot
    Press Key                          ${search-template}        \\13
    Wait Until Element Is Visible      ${nome-template}
    ${text-template}=    Get Text      ${nome-template}
    ${visible}    Run Keyword And Return Status    Should Be Equal As Strings    ${text-template}    teste robot
    Run Keyword If    ${visible} == True    excluir template

excluir template
    Wait Until Element Is Visible    ${checkbox-template}
    Click Element                    ${checkbox-template}
    Wait Until Element Is Visible    ${button-excluir-template}
    Click Element                    ${button-excluir-template}
    Wait Until Element Is Visible    ${button-confirmar-excluir-template}
    Click Button                     ${button-confirmar-excluir-template}
    Sleep                            5s
