class Admin::StatusController < ApplicationController
    def show
       @order = Order.find(params[:id])
       @order_details = @order.order_details
       
       @total = @order_details.inject(0) { |sum, item| sum + item.sum_of_price }
       
    end
    
end
