Dado("que eu fechei o pedido com os seguintes itens:") do |table|
    @product_list = table.hashes #neste caso utilizamos table.hases pois é em colunas
    steps %{
        Quando eu adiciono todos os itens
    }
    @rest_page.cart.close_pedido
end
  
Dado("informei os meus dados de entrega:") do |table|
    user = table.rows_hash # neste caso utilizamos rows pois são estamos utilizando linhas, chave, valor
    @order_page.fill_user_data(user)
end
  
Quando("eu finalizo o pedido com {string}") do |payment|
    @order_page.checkout(payment)
end
  
Então("devo ver a seguinte mensagem:") do |expected_message|
    expect(@order_page.summary).to have_text expected_message
end