*** Settings ***
Resource    ../config/settings.robot

*** Variables ***
# mc defense ia
${url}                        http://10.100.61.145:11080/
${browser}                    chrome
${input_user}                 id:input-text-user-login
${input_senha}                id:input-text-password-login
${Button}                     id:button-submit-login
${title_sucess_login}         Defense IA | Middlewares e Centrais
${element}                    id:1
${text_home}                  //h1
${page_login}                 http://10.100.61.145:11080/login               
${img_logout}                 class:vlbu8k2


# central de incendio
${central-incendio}               ${url}central-incendio
${Button-central-incendio}        xpath=//a[@href="/central-incendio"]
${Button-nova-central}            id:button-create-fire
${input-nome-central}             id:input-text-name-fire
${input-modelo-central}           id:input-select-model-fire
${Button-select-modelo}           id:select-option-viewport
${input-MAC}                      id:input-text-mac-fire
${Button-salvar-central}          id:button-save-fire
${xpath-trocar-page}              xpath=//*[@id="button-chevron-rigth"]/svg
${text_central}                   xpath=//*[@id="-name-index-0"]
${button-confirmar-exclusao}      id:button-confirm-modal
${checkbox-central}               id:checkbox-trigger
${element-lixeira}                id:title-root-delete
${xpath-checkbox}                 xpath=//*[@id="-checkbox-index-1"]//*[@id="checkbox-root"]
${search-central}                 xpath=//*[@id="input-text-search-fire"]
${button-search}                  id:button-search
${checkbox-central-search}        id:checkbox-root
${alert-central-excluida}         xpath=//*[@id="1"]/div[1] 


# central de alarme
${central-alarme}                        xpath=//*[@id="central-alarme"]/button
${button-central-alarme}                 id:menu-central-alarme
${button-central-particao-zona}          xpath=//*[@id="menu-central-alarme"]/p
${button-create-central-alarme}          id:button-create-alarm
${input-nome-central-alarme}             id:input-text-name-alarm
${input-modelo-central-alarme}           xpath=//*[@id="input-select-model-alarm "]
${Button-select-modelo-alarme}           id:select-option-viewport
${input-MAC-alarme}                      id:input-text-mac-alarm
${input-password-central-alarme}         id:input-text-password-alarm
${button-salvar-central-alarme}          id:button-save-alarm
${search-alarme}                         id:input-text-search-alarm
${nome-central-alarme}                   id:alarm-central-name-index-0
${lixeira-alarme}                        id:button-delete-lote-alarm
${button-cancelar-cadastrado}            id:button-cancel-alarm
${url-central-alarme}                    http://10.100.61.145:11080/central-alarme
${checkbox-central-alarme}               id:alarm-central-checkbox-index-0
${lixeira-central-alarme}                id:button-delete-lote-alarm
${teste}                                 id:select-input-root


# templates
${button-templates}                      xpath=//a[@href="/template-eventos"]
${button-new-templates}                  id:button-create-event
${input-nome-evento}                     xpath=/html/body/main/div[2]/div[2]/div[2]/div/div[1]/div/div[1]/div/input
${button-abrir-zonas}                    xpath=/html/body/main/div[2]/div[2]/div[2]/div/div[1]/div/div[3]/div/div/div[1]/div[1]
${button-select-item-1}                  xpath=
${button-select-zonas}                   xpath=
${button-abrir-usuarios}                 xpath=/html/body/main/div[2]/div[2]/div[2]/div/div[1]/div/div[4]/div/div/div[1]
${button-select-usuarios}                xpath=
${button-abrir-sistemas}                 xpath=/html/body/main/div[2]/div[2]/div[2]/div/div[1]/div/div[5]/div/div/div[1]/div[1]
${button-select-sistemas}                xpath=
${button-salvar-template}                id:button-form-save-central
${button-confirm-salvar-template}        id:button-form-save-central
${nome-template}                         id:-name-index-0
${search-template}                       id:input-search
${erro-criar-template}                   xpath=//*[@id="0"]/div[1]
${checkbox-template}                     id:checkbox-root-item
${button-excluir-template}               xpath=/html/body/main/div[2]/div[2]/div[2]/div[2]
${button-confirmar-excluir-template}     id:button-confirm-modal
${text-template} =                       "Disparo silencioso"
# ${text-template}                         xpath=//*[@id="-name-index-0"]