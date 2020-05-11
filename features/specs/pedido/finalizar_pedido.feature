#language: pt

@green_food
Funcionalidade: Finalizar Pedido
    Para que eu possa receber o pedido no meu endereço
    Sendo um usuário que fechou o carrinho com itens
    Posso finalizar o meu pedido

    @pedido
    Cenario: Finalizar pedido com cartão refeição

        Dado que eu fechei o pedido com os seguintes itens:
            | quantidade | nome                | descricao                                | subtotal |
            | 1          | Suco Detox          | Suco de couve, cenoura, salsinha e maçã. | R$ 14,90 |
            | 2          | Hamburger de Quinoa | Cheio de fribas e muito saboroso.        | R$ 21,00 |
        E informei os meus dados de entrega:
            | nome        | Henrique              |
            | email       | henrique@henrique.com |
            | rua         | Baia Blanca           |
            | numero      | 413                   |
            | complemento | Casa                  |
        Quando eu finalizo o pedido com "Cartão Refeição"
        Então devo ver a seguinte mensagem:
        """
        Seu pedido foi recebido pelo restaurante. Prepare a mesa que a comida está chegando!
        """