#language: pt

Funcionalidade: Informações Adicionais
    Para que eu possa ver as informações adicionais
    Sendo um usuário que escolheu um restaurante
    Posso ver categoria, descrição detalhada e horário de funcionamento

    @infos
    Cenario: Detalhes dos restaurantes

        Dado que acesso a lista de restaurantes
        Quando eu escolho o restaurante "Burger House"
        Então eu vejo as seguintes informações adicionais:
            | categoria | Hamburgers                               |
            | descrição | 40 anos se especializando em trash food. |
            | horários  | Funciona todos os dias, de 10h às 22h    | 