class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new
  end

  def create
    @orderform = OrderForm.new(orderform_params)
    if @orderform.valid?
      @orderform.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      redirect_to item_orders_path(@item.id)
    end
  end


  private
    def orderform_params
      params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id].to_i)
    end
end
