class Order < ApplicationRecord
    
    enum payment_method: [ "クレジットカード", "銀行振込", ]
    
    enum status: [ "入金待ち", "入金確認", "制作中", "発送準備中", "発送済み" ]
end
