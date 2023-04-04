class Public::CustomersController < ApplicationController
    def show
        @customer = Customer.find(params[:id])
    end
    
    
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
      @customer = Customer.find(params[:id])
      redirect_to customer_path
    end
end
