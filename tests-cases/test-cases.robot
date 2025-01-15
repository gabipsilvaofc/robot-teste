*** Settings ***
Resource           ../config/settings.robot
Resource           ../resources/resource.robot
Resource           ../resources/variables.robot
Suite Setup        Teste de Login

*** Test Cases ***

# teste concluido
Teste 2: Teste de Login errado
    [Tags]    incendio
    abrir navegador
    sleep  5s
    preencher campos com informação errada
    clicar em enviar
    Sleep    2s
    conferir o aviso de erro

# Teste concluido
Teste 1: Teste de Login
    [Tags]    incendio
    abrir navegador
    sleep  5s
    preencher campos
    clicar em enviar
    Sleep    4s
    conferir o login

# teste concluido
Teste 4: Entrar na pagina de Centrais
    [Tags]    incendio
    levar o cursor ate a barra lateral
    clicar em 'Centrais de incêndio'
    conferir se entrou na pagina

# teste concluido
Teste 5: Adicionar uma central
    [Tags]    incendio
    Entrar na pagina de Centrais
	clicar em 'nova central'
	preencher os campos
    salvar informações da central
    pesquisar central
    confirmar se a central foi criada

# teste concluido
Teste 6: Excluir uma central
    [Tags]    incendio
    Entrar na pagina de Centrais
    pesquisar central
    clicar no checkbox da central
    clicar na lixeira da central
    clicar em confirmar
    confirmar se a central foi excluida

# teste concluido
Teste 7: Cadastro de central sem nome
    [Tags]    incendio
    Entrar na pagina de Centrais
    clicar em 'nova central'
	preencher os campos modelo e MAC
    salvar informações da central
    verificar mensagem de erro de central sem nome
    Sleep    3s

# teste concluido
Teste 8: Cadastro de central sem MAC
    [Tags]    incendio
    Entrar na pagina de Centrais
    clicar em 'nova central'
	preencher os campos nome e modelo
    salvar informações da central
    verificar mensagem de erro de central sem MAC
    Sleep    3s

# teste concluido
Teste 9: Cadastro de central sem modelo
    [Tags]    incendio
    Entrar na pagina de Centrais
    clicar em 'nova central'
    preencher os campos nome e MAC
    salvar informações da central
    verificar mensagem de erro de central sem modelo
    Sleep    3s

# teste concluido
Teste 10.1: Cadastro de central com MAC repetido
    [Tags]    incendio
    Entrar na pagina de Centrais
    clicar em 'nova central'
	preencher os campos com MAC repetido
    salvar informações da central

Teste 10.2: Cadastro de central com MAC repetido
    [Tags]    incendio
    Entrar na pagina de Centrais
    clicar em 'nova central'
	preencher os campos com MAC repetido
    salvar informações da central
    verificar mensagem de erro de central com MAC repetido
    Sleep    3s

# teste concluido
Teste 11: Cadastro de central com MAC inválido
    [Tags]    incendio
    Entrar na pagina de Centrais
    clicar em 'nova central'
    preencher os campos com MAC inválido
    salvar informações da central
    verificar mensagem de erro de central com MAC inválido
    Sleep    3s
#  -------------------------------------------------------------------------------------------------

# teste concluido
Teste 12: Entrar na pagina de Centrais de alarme
    [Tags]    alarme    
    levar o cursor ate a barra lateral
    clicar em 'Centrais de alarme'
    clicar em 'Central, partição e zonas'
    conferir pagina de centrais de alarme

# teste concluido
Teste 13: Tentativa de cadastro de central sem nome
    [Tags]    alarme
    levar o cursor ate a barra lateral
    clicar em 'Central, partição e zonas'
    clicar em 'nova central' alarme
    preencher os campos alarme sem nome
    salvar infos da central alarme
    verificar alerta de erro nome da central alarme

# teste concluido
Teste 14: Tentativa de cadastro de central sem MAC
    [Tags]    alarme
    levar o cursor ate a barra lateral
    clicar em 'Central, partição e zonas'
    clicar em 'nova central' alarme
    preencher os campos alarme sem MAC
    salvar infos da central alarme
    verificar alerta de erro sem MAC da central alarme

# teste concluido
Teste 15: Tentativa de cadastro de central sem modelo
    [Tags]    alarme
    levar o cursor ate a barra lateral
    clicar em 'Central, partição e zonas'
    clicar em 'nova central' alarme    
    preencher os campos alarme sem modelo
    salvar infos da central alarme
    verificar alerta de erro modelo da central alarme

# teste concluido
Teste 16: Tentativa de cadastro de central sem senha
    [Tags]    alarme
    levar o cursor ate a barra lateral
    clicar em 'Central, partição e zonas'
    clicar em 'nova central' alarme
    preencher os campos alarme sem senha
    salvar infos da central alarme
    verificar alerta de erro senha da central alarme

# teste concluido
Teste 17: Tentativa de cadastro de central com MAC inválido
    [Tags]    alarme    
    levar o cursor ate a barra lateral
    clicar em 'Centrais de alarme' condicional
    clicar em 'Central, partição e zonas' condicional
    clicar em 'nova central' alarme
    preencher os campos alarme com MAC inválido
    salvar infos da central alarme
    verificar alerta de erro MAC inválido da central alarme

# teste concluido
Teste 18: Cadastro de central com letra na senha
    [Tags]    alarme
    levar o cursor ate a barra lateral
    clicar em 'Centrais de alarme' condicional
    clicar em 'Central, partição e zonas' condicional
    clicar em 'nova central' alarme
    preencher os campos alarme com letra na senha
    salvar infos da central alarme
    verificar alerta de erro senha com letra da central alarme

# teste concluido
Teste 19: Cadastro de central de alarme
    [Tags]    alarme
    levar o cursor ate a barra lateral
    clicar em 'Centrais de alarme' condicional
    clicar em 'Central, partição e zonas' condicional
    clicar em 'nova central' alarme
    preencher os campos alarme
    salvar infos da central alarme
    verificar sucesso da central alarme

# teste concluido
Teste 20: Tentativa de cadastro de central com MAC repetido
    [Tags]    alarme
    levar o cursor ate a barra lateral
    clicar em 'Centrais de alarme' condicional
    clicar em 'Central, partição e zonas' condicional
    clicar em 'nova central' alarme
    preencher os campos alarme com MAC repetido
    salvar infos da central alarme    
    verificar alerta de erro MAC repetido da central alarme

# teste concluido
Teste 21: Excluir uma central de alarme
    [Tags]    alarme
    levar o cursor ate a barra lateral
    clicar em 'Centrais de alarme' condicional
    clicar em 'Central, partição e zonas' condicional
    pesquisar central pelo nome
    selecionar central e clicar na lixeira
    verificar se a central foi excluida com sucesso
    
# teste concluido
Teste 3: Teste de Logout
    [Tags]    incendio    alarme
    clicar em sair
    Sleep    5s
    confirmar logout
