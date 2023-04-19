class Public::CustomersController < ApplicationController
    def show
        @customer = Customer.find(params[:id])
    end
    
    
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
         redirect_to customer_path(@customer.id)
      else
        render :edit
      end
    end
    
    def withdrawal
      @customer = current_customer
      @customer.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    end
    
    private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
    end
end
