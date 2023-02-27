class Public::CartItemsController < ApplicationController
    def index
      @items = current_customer.cart_items
    end
    
    def create
      @item = CartItem.new(cart_item_params)
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
    
    private
    def cart_item_params
      params.require(:cart_item).permit(:amount)
    end
end
