class OrderDetail < ApplicationRecord
    
    enum making_status: [ "製作不可", "制作待ち", "制作中", "制作完了" ]
    
end
