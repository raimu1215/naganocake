class Public::OrdersController < ApplicationController
    def index
      @orders = Order.all
      @item = Item.find(params[:id])
    end
    
    def create
      @orders = Order.new(cart_item_params)
      @orders.save
      redirect_to orders_confirmation_path
    end
    
    private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id)
    end
end