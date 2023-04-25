class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
   has_many :cart_items, dependent: :destroy
   has_many :addresses, dependent: :destroy
   
#   def active_for_authentication?
#     super && (is_deleted == "退会")
#   end
   
   enum is_deleted: {
     "有効": false, "退会": true
  }
end
