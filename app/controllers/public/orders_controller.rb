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
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
      elsif params[:order][:address_number] == "2"
        if Address.exists?(name: params[:order][:registered])
          @order.name = Address.find(params[:order][:registered]).name
          @order.address = Address.find(params[:order][:registered]).address
        else
           render :new
        end
      elsif params[:order][:address_number] == "3"
         address_new = current_customer.addresses.new(address_params)
         if address_new.save # 確定前(確認画面)で save してしまうことになりますが、私の知識の限界でした
         else
         render :new
         end
      @orders = Order.new
      @orders.customer_id = current_customer.id
      @orders.shipping_cost = 800
      @orders.total_payment = @orders.shipping_cost + @total
    end
    
    def create
      @cart_items = current_customer.cart_items.all
      @order = current_customer.orders.new(order_params)
      if @order.save
        @cart_items.each do |cart_item|
          @order_item = OrderItem.new
          @order_item.item_id = cart_item.item_id
          @order_item.order_id = @order.id
          @order_item.order_amount = cart_item.amount
          @order_item.order_price = cart_item.item.price
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
      params.require(:order).permit(:name, :address, :postal_code, :payment_method)
    end
    
    def address_params
      params.require(:order).permit(:name, :address)
    end
  end
end