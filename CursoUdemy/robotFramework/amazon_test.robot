*** Settings ***
Documentation   Essa suíte testa o site da Amazon
Resource        /home/ana.euzebio@dynamox.local/CursoUdemy/robotFramework/amazon_resources.robot
Test Setup      Abrir o navegador
# Test Teardown   Fechar o navegador

*** Test Cases ***
Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]   Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...               e verifica a categoria Computadores e Informática
    [Tags]            menus
    Acessar a home page do site da Amazon
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"

Caso de teste 02 - Pesquisa de um produto
    [Documentation]   Esse teste verifica a busca de um produto
    [Tags]            busca_produtos
    Acessar a home page do site da Amazon
    Digitar o nome do produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão de Pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Series S"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site da Amazon
    Digitar o nome do produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão de Pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site da Amazon
    Digitar o nome do produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão de Pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio
