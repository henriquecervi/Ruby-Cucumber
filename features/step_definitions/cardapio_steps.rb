Dado("que acesso a lista de restaurantes") do
    visit '/restaurants'
  end
  
  Quando("eu escolho o restaurante {string}") do |restaurante|
    find(".restaurant-item", text: restaurante.upcase).click
  end
  
  Então("vejo os seguintes itens disponíveis no cardápio") do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    items = all(".menu-item-info-box")

    product_data = table.hashes

    product_data.each_with_index do | value, index |
        expect(items[index]).to have_text value["produto"].upcase  
        expect(items[index]).to have_text value["descrição"] 
        expect(items[index]).to have_text value["preço"]
    end    
  end

  Então("eu vejo as seguintes informações adicionais:") do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    infos = table.rows_hash # nesse caso estamos utilizando a tabela em formato de linhas, não de coluna
    detail = find('#detail')
    expect(detail).to have_text infos['categoria']  
    expect(detail).to have_text infos['descrição'] 
    expect(detail).to have_text infos['horários'] 
    
  end