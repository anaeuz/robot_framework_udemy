
*** Settings ***
Library    SeleniumLibrary
Variables    ../../robot_framework_udemy/robotFramework/variables.py

*** Keywords ***
Abrir o navegador
    Open Browser   browser=${Browser}  options=add_experimental_option("detach", True)
    Maximize Browser Window
Fechar o navegador
    Close Browser
Acessar a home page do site da Amazon
    Go To    ${URL}
    Wait Until Element Is Visible    ${LOGO}
Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}
Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Element Is Visible   locator=//h1[contains(.,"Eletrônicos e Tecnologia")]   timeout=10s
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}
Verificar se aparece a categoria "Computadores e Informática"
    # Verifica se a lista está presente
    ${lista}    Get WebElement    xpath=//ul[contains(@class, 'a-unordered-list') and contains(@class, 'a-nostyle') and contains(@class, 'a-vertical') and contains(@class, 'a-spacing-medium')]
    # Obtém o item específico da lista
    ${item}     Get WebElement    xpath=//ul[contains(@class, 'a-unordered-list') and contains(@class, 'a-nostyle') and contains(@class, 'a-vertical') and contains(@class, 'a-spacing-medium')]/li[2]
    # Clica no item da lista
    Click Element    ${item}
Digitar o nome do produto "${TEXTO_PESQUISA}" no campo de Pesquisa
    Input Text    locator=twotabsearchtextbox    text=${TEXTO_PESQUISA}
Clicar no botão de Pesquisa
    Click Button    locator=nav-search-submit-button
Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,"${PRODUTO}")])[3]
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site da Amazon
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
     Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome do produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão de Pesquisa
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"
E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    locator=(//span[contains(.,'Console Xbox Series S')])[3]
    Click Button     locator=//input[@id='add-to-cart-button']

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//h1[contains(.,'Adicionado ao carrinho')]

Remover o produto "Console Xbox Series S" do carrinho
    Click Element    //a[@id='nav-cart']
    Click Element    locator=//input[@value='Excluir']
Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//span[contains(.,'foi removido de Carrinho de compras.')]

Acessar o menu de login
   Go To    ${URL}
   Click Element     locator=//span[contains(@id,'nav-link-accountList-nav-line-1')]

Preencher o email
    [Arguments]       ${username}   
    Input Text        locator=//input[contains(@type,'email')]      text=${username}
    Click Element     locator=//input[@class='a-button-input']

Preencher a senha
    [Arguments]       ${password}                                        
    Input Password    locator=//input[contains(@id,'password')]     password=${password}

Logar
    Click Button    locator=//input[contains(@class,'a-button-input')]


Exibe a mensagem de erro
    Element Should Be Visible    locator=//div[@class='a-alert-content'][contains(.,'Insira um endereço de e-mail ou número de telefone válido')]