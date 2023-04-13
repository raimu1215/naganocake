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
    
    def withdrawal
      @customer = current_customer
      @customer.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    end
end
