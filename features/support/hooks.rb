    
    Before do
        page.current_window.resize_to(1440, 900)

        @cart_page = CartPage.new
    end
    
    Before("@bread_bakery") do
        visit '/restaurants/bread-bakery/menu'
    end