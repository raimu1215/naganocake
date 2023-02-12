class Admin::HomesController < ApplicationController
    def top
        @order_histories = Order_history.page(params[:page])
    end
end
