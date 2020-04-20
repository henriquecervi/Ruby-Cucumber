#language: pt

Funcionalidade: Remover itens do carrinho
    Para que eu possa manter meu carrinho apenas com itens desejados
    Sendo um cliente que desistiu de um ou mais produtos
    Posso remover itens do meu carrinho

    Cenario: Remover um item

        Dado que eu tenho os seguintes itens no carrinho:
            | nome                   | preço    |
            | Cup Cake               | R$ 8,70  |
            | Donut                  | R$ 2,50  |
            | Pão Artesanal Italiano | R$ 15.90 |
        Quando eu removo somente o item 1
        Então o valor total do carrinho deve ser de "R$ 18,40"
        
    Cenario: Remover todos os itens
        
        Dado que eu tenho os seguintes itens no carrinho:
            | nome                   | preço    |
            | Cup Cake               | R$ 8,70  |
            | Donut                  | R$ 2,50  |
            | Pão Artesanal Italiano | R$ 15.90 |
        Quando eu remover todos os itens
        Então vejo a seguinte mensagem no carrinho "Seu carrinho está vazio!"