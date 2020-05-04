Dado("que o produto desejado é o {string}") do |produto|
    @produto_nome = produto
  end
  
  Dado("o valor do produto é de {string}") do |valor|
    @produto_valor = valor
  end
  
  Quando("eu adiciono {int} unidade\\(s)") do |quantidade|
    quantidade.times do # times é como se fosse um loop, ou seja efetua conforme número de vezes da var.
    @rest_page.add_cart(@produto_nome)
    end
  end
  
  Então("{int} unidade\\(s) deste item deve ser adicionado ao carrinho") do |quantidade|
    
    expect(@rest_page.cart.box).to have_text "(#{quantidade}x) #{@produto_nome}" # interpolação de string
  end
  
  Então("o valor total deve ser de {string}") do |valor_total|    
    expect(@rest_page.cart.total_find.text).to eql valor_total
  end

  # adicionando vários itens

  Dado("que os produtos desejados são:") do |table|
    @product_list = table.hashes
  end
  
  Quando("eu adiciono todos os itens") do
    @product_list.each do |p|
      p["quantidade"].to_i.times do
        @rest_page.add_cart(p["nome"])
      end
    end
  end
  
  Então("vejo todos os itens no carrinho") do
     @product_list.each do |p|
      expect(@rest_page.cart.box).to have_text "(#{p["quantidade"]}x) #{p["nome"]}"
    end
  end

  # removendo item do carrinho

  Dado("que eu tenho os seguintes itens no carrinho:") do |table|
    @product_list = table.hashes
    steps %{
      Quando eu adiciono todos os itens 
    } # %{} isso se chama dynamics steps, ele está puxando esse BDD, pois o código é o mesmo
  end
  

  Quando("eu remover somente o {int}") do |item|
    @rest_page.cart.remove_item(item)
  end


  # removendo todos os itens do carrinho

  Quando("eu remover todos os itens") do
    @product_list.each_with_index do |value, idx|
      @rest_page.cart.remove_item(idx)
    end
  end

  Quando("eu limpo o meu carrinho") do
    @rest_page.cart.clean
  end
  
  Então("vejo a seguinte mensagem no carrinho {string}") do |mensagem|
    expect(@rest_page.cart.box).to have_text mensagem
  end
  
