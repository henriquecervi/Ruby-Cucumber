#language: pt

Funcionalidade: Restaurantes    
    Para que eu possa saber quais os restaurantes disponíveis com o tempo de entrega e nota de avaliação
    Sendo um usuário que deseja pedir comida
    Posso acessar a lista de restaurantes

    Contexto: Lista de Restaurantes
# utilizado quando os steps são iguais.
        Dado que tenho uma lista de restaurantes
        Quando acesso a lista de restaurantes
    
    Cenario: Todos os restaurantes
        
        Então vejo todas as opções disponíveis
    
    Cenario: Categorias

        Então cada restaurante deve exibir sua categoria

    Cenario: Tempo de entrega

        Então cada restaurante deve exibir o tempo de entrega

    Cenario: Nota de avaliação

        Então cada restaurante deve exibir sua nota de avaliação


    ###### Esquema de Cenário #######

    @outline
    Esquema do Cenario: Restaurantes Disponíveis

        Quando acesso a lista de restaurantes
        Então cada restaurante deve ter <id> <nome> <categoria> <entrega> <avaliacao>

        Exemplos:

        | id | nome             | categoria    | entrega      | avaliacao |
        | 0  | "Bread & Bakery" | "Padaria"    | "25 minutos" | 4.9       |
        | 1  | "Burger House"   | "Hamburgers" | "30 minutos" | 3.5       |
        | 2  | "Coffee Corner"  | "Cafeteria"  | "20 minutos" | 4.8       |


    ###### Cenário com Tabela #######

    @table
    Cenario: Restaurantes Disponíveis

        Dado que eu tenho uma lista de restaurantes

            | nome           | categoria  | entrega    | avaliacao |
            | Bread & Bakery | Padaria    | 25 minutos | 4.9       |
            | Burger House   | Hamburgers | 30 minutos | 3.5       |
            | Coffee Corner  | Cafeteria  | 20 minutos | 4.8       |

        Quando acesso a lista de restaurantes
        Então devo ver todos os restaurantes desta lista