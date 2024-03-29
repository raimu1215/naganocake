class Order < ApplicationRecord
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    
    has_many :order_details, dependent: :destroy
   # has_many :cart_item, dependent: :destroy
    
    def add_tax_price
        (price * 1.10).round
    end
end
