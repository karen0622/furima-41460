class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end

  
  def create
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
       @purchase_form.save
       redirect_to  items_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      puts @purchase_form.errors.full_messages
      render:index,status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:post_code,:area_id, :city, :address, :phone_number, :building)
    .merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end
  
  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount:@item.price,
    card: purchase_params[:token],  
    currency: 'jpy'                 
  )
  end
end
