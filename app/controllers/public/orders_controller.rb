class Public::OrdersController < ApplicationController
  
    def new
      @order = Order.new
    end
  
    def index
      @orders = Order.all
      #@item = Item.find(params[:id])
    end
    
    def show
     @order = Order.new(order_params)
    end
    
    def confirmation
      @cart_items = current_customer.cart_items
      @cart_item= current_customer.cart_items.all
      @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
      @order = Order.new(order_params)
      
      if params[:order][:address_number] == "1"
        # @address = Customer.find(params[:order][:_id])
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.first_name + current_customer.last_name
      elsif params[:order][:address_number] == "2"
        if Address.exists?(name: params[:order][:registered])
          @order.name = Address.find(params[:order][:registered]).name
          @order.address = Address.find(params[:order][:registered]).address
        else
           render :new
        end
      elsif params[:order][:address_number] == "3"
         address_new = current_customer.addresses.new(address_params)
         address_new.save 
      
          @orders = Order.new
          @orders.customer_id = current_customer.id
          
      end
    end
    
    def create
      @cart_items = current_customer.cart_items.all
      @order = Order.new(order_params)
      @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
      @order.shipping_cost = 800
      @order.total_payment = @order.shipping_cost + @total
      if @order.save
        @cart_items.each do |cart_item|
          @order_item = OrderDetail.new
          @order_item.item_id = cart_item.item_id
          @order_item.order_id = @order.id
          @order_item.order_id = cart_item.amount
          @order_item.order_id = cart_item.item.price
          @order_item.save
      end
    redirect_to orders_thanks_path
    @cart_items.destroy_all
      else
    @order = Order.new(order_params)
    render :new
      end
      #@orders = Order.new(order_params)
     # @orders.customer_id = current_customer.id
      #@orders.shipping_cost = 800
      #@cart_items = current_customer.cart_items
      #@cart_items.each do |cart_item|
      #total += cart_item.subtotal
     # end
     # @orders.total_payment = @orders.shipping_cost + total
     
     # @orders.save
     # redirect_to orders_confirmation_path
    end
    
  private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id)
    end
    
    def order_params
      params.require(:order).permit(:name, :address, :postal_code, :payment_method, :total_payment, :customer_id)
    end
    
    def address_params
      params.require(:order).permit(:name, :address)
    end
  
end