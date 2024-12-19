class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :restriction, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_form = PurchaseForm.new
  end

  
  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end

  def restriction
    if @item.user_id == current_user.id
      redirect_to root_path
    elsif @item.purchase.present?
      redirect_to root_path
    end
  end

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
