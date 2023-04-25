class Admin::
  CustomersController < ApplicationController
    def index
        @customer = Customer.page(params[:page])
        @customers = Customer.all
    end
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    def update
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
         redirect_to admin_customer_path(@customer.id)
      else
        render :edit
      end
    end
    
    def destroy
      @customer = Customer.find(params[:id])
      @customer.destroy
      redirect_to root_path
    end
    
    private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
    end
end
