class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_from = PurchaseFrom.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_from = PurchaseFrom.new(purchase_params)
    if @purchase_from.valid?
       @purchase_from.save
       redirect_to  items_path
    else
      render:index,status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_from).permit(:post_code, :area_id, :city, :address, :phone_number, :building)
    .merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
