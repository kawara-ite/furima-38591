class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @orderaddress = OrderAddress.new
  end

  def create
    @orderaddress = OrderAddress.new(orderaddress_params)
    if @orderaddress.valid?
      @orderaddress.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      redirect_to item_orders_path(@item.id)
    end
  end


  private
    def oorderaddress_params
      params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id].to_i)
    end
end
