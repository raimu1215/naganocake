class OrderDetail < ApplicationRecord
    
    enum making_status: [ "製作不可", "制作待ち", "制作中", "制作完了" ]
    
    belongs_to :order
    belongs_to :item
    
    def sum_of_price
      price * amount
    end
    
end
