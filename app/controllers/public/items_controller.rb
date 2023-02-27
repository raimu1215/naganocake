class Public::ItemsController < ApplicationController
    def index
        @items = Item.all
        @item = Item.page(params[:page])
    end
    
    def show
        @item = Item.find(params[:id])
        @cart_item = CartItem.new
    end
    
    def create
      @item = CartItem.new(cart_item_params)
      @item.save
      redirect_to cart_items_path
    end
    
    private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_image)
    end
end
