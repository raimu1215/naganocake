class Item < ApplicationRecord
    
    has_one_attached :item_image
    has_many :order_details, dependent: :destroy
    
    def get_image
      (item_image.attached?) ? item_image : 'no_image.jpg'
    end
    
    def with_tax_price
      (price * 1.1).floor
    end
    
    def taxin_price
        price*1.1
    end

end
