#language: pt

@bread_bakery
Funcionalidade: Adicionar ao carrinho
    Para que eu possa finalizar uma compra
    Sendo um cliente que já decidiu o que deseja comer
    Posso adicionar itens ao meu carrinho

Cenario: Adicionar uma unidade ao carrinho
    
    Dado que o produto desejado é o "Cup Cake"
    E o valor do produto é de "R$ 8,70"
    Quando eu adiciono 1 unidade(s)
    Então 1 unidade(s) deste item deve ser adicionado ao carrinho
    E o valor total deve ser de "R$ 8,70"


Cenario: Adicionar duas unidades ao carrinho

    Dado que o produto desejado é o "Donut"
    E o valor do produto é de "R$ 2,50"
    Quando eu adiciono 2 unidade(s)
    Então 2 unidade(s) deste item deve ser adicionado ao carrinho
    E o valor total deve ser de "R$ 5,00"

@temp
Cenario: Adicionar varios itens ao carrinho

    Dado que os produtos desejados são:
        | nome                   | preço    | quantidade |
        | Cup Cake               | R$ 8,70  | 2          |
        | Donut                  | R$ 2,50  | 1          |
        | Pão Artesanal Italiano | R$ 15.90 | 3          |
    Quando eu adiciono todos os itens
    Então vejo todos os itens no carrinho
    E o valor total deve ser de "R$ 67,60"