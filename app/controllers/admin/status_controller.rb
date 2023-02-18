class Admin::StatusController < ApplicationController
    def show
       @order = Order.all
    end
    
end
