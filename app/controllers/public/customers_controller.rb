class Public::CustomersController < ApplicationController
    def show
        @customers = Customer.find(params[:id])
    end
end
