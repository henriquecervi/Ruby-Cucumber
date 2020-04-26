Dado("que o produto desejado é o {string}") do |produto|
    @produto_nome = produto
  end
  
  Dado("o valor do produto é de {string}") do |valor|
    @produto_valor = valor
  end
  
  Quando("eu adiciono {int} unidade\\(s)") do |quantidade|
    quantidade.times do # times é como se fosse um loop, ou seja efetua conforme número de vezes da var.
    find(".menu-item-info-box", text: @produto_nome.upcase).find(".add-to-cart").click
    sleep 3
    end
  end
  
  Então("{int} unidade\\(s) deste item deve ser adicionado ao carrinho") do |quantidade|
    cart = find("#shopping-cart")
    expect(cart).to have_text "(#{quantidade}x) #{@produto_nome}" # interpolação de string
  end
  
  Então("o valor total deve ser de {string}") do |valor_total|
    cart = find("#shopping-cart")
    total = cart.find("tr", text: "Total").find("td")
    expect(total.text).to eql valor_total
  end

  # adicionando vários itens

  Dado("que os produtos desejados são:") do |table|
    @product_list = table.hashes
  end
  
  Quando("eu adiciono todos os itens") do
    @product_list.each do |p|
      p["quantidade"].to_i.times do
    find(".menu-item-info-box", text: p["nome"].upcase).find(".add-to-cart").click
      end
    end
  end
  
  Então("vejo todos os itens no carrinho") do
    cart = find("#shopping-cart")
    @product_list.each do |p|
      expect(cart).to have_text "(#{p["quantidade"]}x) #{p["nome"]}"
    end
  end