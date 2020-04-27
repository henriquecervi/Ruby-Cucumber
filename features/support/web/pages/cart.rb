
class CartPage
    include Capybara::DSL

    def box
        @cart_page = find("#shopping-cart")
    end

    def total_find
        box.find("tr", text: "Total").find("td")
    end

    def remove_item(item)
        box.all("table tbody tr")[item].find(".danger").click
    end
end