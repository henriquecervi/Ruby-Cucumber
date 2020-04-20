#language: pt

Funcionalidade: Adicionar ao carrinho
    Para que eu possa finalizar uma compra
    Sendo um cliente que já decidiu o que deseja comer
    Posso adicionar itens ao meu carrinho

Cenario: Adicionar uma unidade ao carrinho
    
    Dado que o produto desejado é o "Cup Cake"
    E o valor do produto é de "R$ 8,70"
    Quando eu clicar no botão adicionar
    Então uma unidade deste item deve ser adicionado ao carrinho
    E o valor total deve ser de "R$ 8,70"

Cenario: Adicionar duas unidades ao carrinho

    Dado que o produto desejado é o "Donut"
    E o valor do produto é de "R$ 2,50"
    Quando eu clicar duas vezes no botão adicionar
    Então duas unidades deste item deve ser adicionado ao carrinho
    E o valor total deve ser de "R$ 5,00"

Cenario: Adicionar varios itens ao carrinho

    Dado que os produtos desejados são:
        | nome                   | preço    |
        | Cup Cake               | R$ 8,70  |
        | Donut                  | R$ 2,50  |
        | Pão Artesanal Italiano | R$ 15.90 |
    Quando eu adiciono todos os itens
    Então vejo todos os itens no carrinho
    E o valor total deve ser de "R$ 27,10"