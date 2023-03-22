class CartItem < ApplicationRecord
    
    belongs_to :customer
    belongs_to :item
   # belongs_to :order
   
   def add_tax_price
        (item.price * 1.10).round
   end
    
    def subtotal
      item.with_tax_price * amount
    end
    
    def sum_of_price
      item.taxin_price * amount
    end
    
end
