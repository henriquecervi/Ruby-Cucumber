Dado("que acesso a lista de restaurantes") do
    @rest_list_page.load
  end
  
  Quando("eu escolho o restaurante {string}") do |restaurante|
    @rest_list_page.go(restaurante)
  end
  
  Então("vejo os seguintes itens disponíveis no cardápio") do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    items = @rest_page.menu

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
    detail = @rest_page.details
    expect(detail).to have_text infos['categoria']  
    expect(detail).to have_text infos['descrição'] 
    expect(detail).to have_text infos['horários'] 
    
  end