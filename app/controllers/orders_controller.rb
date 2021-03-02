class OrdersController < ApplicationController

  def index
    @order_purchaser = OrderPurchaser.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_purchaser = OrderPurchaser.new(purchaser_params)
    @item = Item.find(params[:item_id])
    if @order_purchaser.valid?
       @order_purchaser.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:order_purchaser).permit(:post_code, :shipping_area_id, :shipping_city, :shipping_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
