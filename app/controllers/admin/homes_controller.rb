class Admin::HomesController < ApplicationController
    def top
        @order_details = OrderDetail.all
        @order_detail = @order.order_detail
        @order_history = Order.page(params[:page])
    end
end
