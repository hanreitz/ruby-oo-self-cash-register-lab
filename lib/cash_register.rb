class CashRegister
    attr_accessor :discount, :total, :items, :most_recent

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def total=(total)
        @total = total*(1-(@discount/100))
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        i = 0
        while i < quantity
            @items << title
            i += 1
        end
        self.most_recent = price * quantity
    end

    def apply_discount
        if @discount > 0
            self.total = (@total*((100.0-@discount)/100.0)).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end
    
    def void_last_transaction
        self.total = self.total - self.most_recent
    end
end

