class Admin::ItemsController < ApplicationController
    def index
      @items = Item.all
      @item = Item.page(params[:page])
    end
    
    def show
      
    end
    
    
    
end

