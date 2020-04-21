Dado("que o produto desejado é o {string}") do |produto|
    @produto_nome = produto
  end
  
  Dado("o valor do produto é de {string}") do |valor|
    @produto_valor = valor
  end
  
  Quando("eu clicar no botão adicionar") do
    find(".menu-item-info-box", text: @produto_nome.upcase).find(".add-to-cart").click 
    sleep 3
  end
  
  Então("{int} unidade deste item deve ser adicionado ao carrinho") do |quantidade|
    cart = find(".box-body")
    expect(cart).to have_text "(#{quantidade}x) #{@produto_nome}" # interpolação de string
  end
  
  Então("o valor total deve ser de {string}") do |valor_total|
    cart = find("#cart")
    expect(cart).to have_text valor_total
    sleep 3
  end