class Item < ApplicationRecord
    
    has_one_attached :item_image
    
    def get_image
      (item_image.attached?) ? item_image : 'no_image.jpg'
    end

end
