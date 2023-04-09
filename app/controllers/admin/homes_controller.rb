class Admin::HomesController < ApplicationController
    def top
        @orders = Order.all
        
        @order_history = Order.page(params[:page])
    end
end
