class Order < ApplicationRecord
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    
    has_many :order_details, dependent: :destroy
   # has_many :cart_item, dependent: :destroy
    
    def subtotal
      item.with_tax_price * amount
    end
    
end
