class RestaurantListPage
    include Capybara::DSL

    def load
        visit '/restaurants'        
    end

    def list
        all('.restaurant-item') # o metodo all devolve um array.
    end

    def go(restaurant)
        find(".restaurant-item", text: restaurant.upcase).click        
    end
end 