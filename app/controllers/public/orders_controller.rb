class Public::OrdersController < ApplicationController
    def index
      @orders = Order.all
      @item = Item.find(params[:id])
    end
end
