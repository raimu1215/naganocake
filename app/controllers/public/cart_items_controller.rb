class Public::CartItemsController < ApplicationController
    def index
      @cart_items = current_customer.cart_items
      # @total = 0
    end
    
    
    
    def create
      @item = CartItem
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
