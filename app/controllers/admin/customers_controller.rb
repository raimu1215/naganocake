class Admin::CustomersController < ApplicationController
    def index
        @customers = Customer.page(params[:page])
    end
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    def update
      @customer = Customer.find(params[:id])
      redirect_to admin_customer_path
    end
    
end
