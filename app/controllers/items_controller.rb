class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :set_item, only: [:edit, :show,:update,:destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new,status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if @item.user_id == current_user.id && @item.purchase.nil?
    else
      redirect_to root_path
    end
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit,status: :unprocessable_entity
    end
  end


  def destroy
    if @item.user_id == current_user.id
       @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :product_condition_id, :shipping_cost_id, :area_id, :shipping_date_id,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end