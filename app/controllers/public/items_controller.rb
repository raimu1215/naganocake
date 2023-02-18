class Public::ItemsController < ApplicationController
    @item = Item.page(params[:page])
end
