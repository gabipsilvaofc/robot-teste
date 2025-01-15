*** Settings ***
Resource           ../config/settings.robot
Resource           ../resources/resource.robot
Resource           ../resources/variables.robot
Suite Setup        Teste de Login
Library    Collections
Library    String

*** Keywords ***
clicar em 'Templates'
    Wait Until Element Is Visible    ${button-templates}
    Mouse Over                       ${button-templates}
    Click Element                    ${button-templates}

clicar em 'Novo template'
    Wait Until Element Is Visible    ${button-new-templates}
    Click Element                    ${button-new-templates}

preencher o campo nome evento
    Wait Until Element Is Visible    ${input-nome-evento}
    Input Text                       ${input-nome-evento}    teste-robot
*** Keywords ***
Selecionar Itens e Zonas
    Wait Until Element Is Visible    ${button-abrir-zonas}
    # abre
    Click Element                    ${button-abrir-zonas}
    ${elementos} =    Get WebElements    xpath=//*[contains(@id, '-name-index-')]
    ${id_checkbox} =    Set Variable    ${EMPTY}
    FOR    ${elemento}    IN    @{elementos}
        ${id_elemento} =    Get Element Attribute    ${elemento}    id
        ${numero} =    Extract Numero Do Id    ${id_elemento}
        ${texto_elemento} =    Get Text    ${elemento}
        Run Keyword If    '${texto_elemento}' == '${text-template}'    Substituir Id Do Checkbox    ${numero}
    END
    ${id_checkbox} =    Create Checkbox Id    ${numero}
    Set Checkbox    ${id_checkbox}
    Sleep    5s
    # fecha
    # Click Element                    ${button-abrir-zonas}

Extract Numero Do Id
    [Arguments]    ${id_elemento}
    ${partes} =    Split String    ${id_elemento}    '-'
    ${index} =    Get Index From List    ${partes}    ${text-template}
    ${numero} =    Get From List    ${partes}    ${index}
    [Return]    ${numero}
# Extract Numero Do Id
#     [Arguments]    ${id_elemento}
#     ${partes} =    Split String    ${id_elemento}    '-'
#     ${numero} =    Run Keyword If    len(${partes}) > 3    Get From List    ${partes}    3    ELSE    Set Variable    0
#     [Return]    ${numero}

Substituir Id Do Checkbox
    [Arguments]    ${numero}
    ${id_checkbox} =    Create Checkbox Id    ${numero}
    Set Checkbox    ${id_checkbox}

Create Checkbox Id
    [Arguments]    ${numero}
    [Return]    -checkbox-index-${numero}

Set Checkbox
    [Arguments]    ${id_checkbox}
    Click Element    id=${id_checkbox}

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


*** Test Cases ***
Teste 22: Teste de criação de templates de alarme
    [Tags]    templates
    levar o cursor ate a barra lateral
    clicar em 'Centrais de alarme'
    clicar em 'Templates'
    clicar em 'Novo template'
    preencher o campo nome evento
    salvar template
    verificar sucesso do template

Teste 23: Teste de exclusão de templates de alarme
    [Tags]    templates
    levar o cursor ate a barra lateral
    clicar em 'Centrais de alarme'
    clicar em 'Templates'
    selecionar o template    
    # verificar se o template foi excluido - adicionar no proximo commit

Teste 24: Teste de criação de evento
    [Tags]    templates
    levar o cursor ate a barra lateral
    clicar em 'Centrais de alarme'
    clicar em 'Templates'
    clicar em 'Novo template'
    preencher o campo nome evento
    Selecionar Itens e Zonas
    Sleep    5s
    # selecionar usuarios
    # salecionar sistemas
    # salvar template
    # verificar sucesso do template
