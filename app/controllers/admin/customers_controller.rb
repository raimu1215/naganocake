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
end
