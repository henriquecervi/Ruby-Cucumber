Dado("que o produto desejado é o {string}") do |produto|
    @produto_nome = produto
  end
  
  Dado("o valor do produto é de {string}") do |valor|
    @produto_valor = valor
  end
  
  Quando("eu adiciono {int} unidade\\(s)") do |quantidade|
    quantidade.times do # times é como se fosse um loop, ou seja efetua conforme número de vezes da var.
    find(".menu-item-info-box", text: @produto_nome.upcase).find(".add-to-cart").click
    end
  end
  
  Então("{int} unidade\\(s) deste item deve ser adicionado ao carrinho") do |quantidade|
    
    expect(@cart_page.box).to have_text "(#{quantidade}x) #{@produto_nome}" # interpolação de string
  end
  
  Então("o valor total deve ser de {string}") do |valor_total|    
    expect(@cart_page.total_find.text).to eql valor_total
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
     @product_list.each do |p|
      expect(@cart_page.box).to have_text "(#{p["quantidade"]}x) #{p["nome"]}"
    end
  end

  # removendo item do carrinho

  Dado("que eu tenho os seguintes itens no carrinho:") do |table|
    @product_list = table.hashes
    steps %{
      Quando eu adiciono todos os itens 
    } # isso se chama dynamics steps, ele está puxando esse BDD, pois o código é o mesmo
  end
  

  Quando("eu remover somente o {int}") do |item|
    @cart_page.remove_item(item)
  end


  # removendo todos os itens do carrinho

  Quando("eu remover todos os itens") do
    @product_list.each_with_index do |value, idx|
      @cart_page.remove_item(idx)
    end
  end

  Quando("eu limpo o meu carrinho") do
    click_button "Limpar"
  end
  
  Então("vejo a seguinte mensagem no carrinho {string}") do |mensagem|
    expect(@cart_page.box).to have_text mensagem
  end
  
