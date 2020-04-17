
Dado("que tenho uma lista de restaurantes") do
  # o @ quer dizer que estava criando uma viaravel de instacia, onde todos podem visualizar.

  # a massa dados precisa estar na ORDEM.
  @restaurants_data = [

    { name: 'Bread & Bakery', category: 'Padaria', delivery_time: '25 minutos', rating: 4.9 },
    { name: 'Burger House', category: 'Hamburgers', delivery_time: '30 minutos', rating: 3.5 },
    { name: 'Coffee Corner', category: 'Cafeteria', delivery_time: '20 minutos', rating: 4.8 }
  ]
end

Quando("acesso a lista de restaurantes") do
 visit '/restaurants'
end
  
Então("vejo todas as opções disponíveis") do
  restaurantes = all('.restaurant-item') # o metodo all devolve um array.
  expect(restaurantes.size).to be > 0
end
  
Então("cada restaurante deve exibir sua categoria") do
  restaurantes = all('.restaurant-item') # pega todos os restaurantes com todas informações

  @restaurants_data.each_with_index do |value, index| # faz uma "varredura" por index
    expect(restaurantes[index]).to have_text value[:category] # fazemos a expectativa pelo que queremos.
  end
end
  
Então("cada restaurante deve exibir o tempo de entrega") do
  restaurantes = all('.restaurant-item')

  @restaurants_data.each_with_index do |value, index|
    expect(restaurantes[index]).to have_text value[:delivery_time]
  end
end
  
Então("cada restaurante deve exibir sua nota de avaliação") do
  restaurantes = all('.restaurant-item')

  @restaurants_data.each_with_index do |value, index|
    expect(restaurantes[index]).to have_text value[:rating]
  end
end

############ Scenario Outline #############

Então("cada restaurante deve ter {int} {string} {string} {string} {float}") do |id, name, category, delivery_time, rating|
  restaurantes = all('.restaurant-item')

  expect(restaurantes[id]).to have_text name.upcase  
  expect(restaurantes[id]).to have_text category
  expect(restaurantes[id]).to have_text delivery_time 
  expect(restaurantes[id]).to have_text rating
  
end

############ Cenário com Tabela #############

Dado("que eu tenho uma lista de restaurantes") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  @restaurants_data = table.hashes # o hashes transforma a table para um array
  
end

Então("devo ver todos os restaurantes desta lista") do
  restaurantes = all('.restaurant-item')

  @restaurants_data.each_with_index do |value ,index |
    expect(restaurantes[index]).to have_text value ['nome'].upcase  # precisamos converter para maísculo por que no site está assim
    expect(restaurantes[index]).to have_text value ['categoria'] 
    expect(restaurantes[index]).to have_text value ['entrega'] 
    expect(restaurantes[index]).to have_text value ['avaliacao'].to_f  # precisamos converter para float, visto que na tabela todos
  # os dados são string
  end
  
end

