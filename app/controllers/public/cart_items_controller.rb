class Public::CartItemsController < ApplicationController
    def index
      @cart_items = current_customer.cart_items
      # @total = 0
    end
    
    
    
    def create
    end
    
    def update
      @cart_items = CartItem.find(params[:id])
      if @cart_items.update!(cart_item_params)
         redirect_to cart_item_path
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
