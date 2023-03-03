class Public::CartItemsController < ApplicationController
    def index
      @cart_items = current_customer.cart_items
      @total = @cart_items
    end
    
    def with_tax_price
      (price * 1.1).floor
    end
    
    def subtotal
      item.with_tax_price * amount
    end
    
    def create
      @item = CartItem.new(cart_item_params)
      @item.customer_id = current_customer.id
      @item.save
      redirect_to cart_items_path
    end
    
    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
         redirect_to cart_items_path
      else
        render :index
      end
    end
    
    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to cart_items_path
    end
    
    def destroy_all
      CartItem.destroy_all
      redirect_to cart_items_path
    end
    
    private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id)
    end
end
