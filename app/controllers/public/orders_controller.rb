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
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      
      @orders = Order.new
      @orders.customer_id = current_customer.id
      @orders.shipping_cost = 800
      @orders.total_payment = @orders.shipping_cost + @total
    
    end
    
    def create
      @orders = Order.new(order_params)
      @orders.customer_id = current_customer.id
      @orders.shipping_cost = 800
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
      total += cart_item.subtotal
      end
      @orders.total_payment = @orders.shipping_cost + total
     
      @orders.save
      redirect_to orders_confirmation_path
    end
    
    private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id)
    end
    
    def order_params
      params.require(:order).permit(:name, :address, :postal_code, :payment_method)
    end
end