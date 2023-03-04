class Item < ApplicationRecord
    
    has_one_attached :item_image
    
    def get_image
      (item_image.attached?) ? item_image : 'no_image.jpg'
    end
    
    def with_tax_price
      (price * 1.1).floor
    end
    
    

end
