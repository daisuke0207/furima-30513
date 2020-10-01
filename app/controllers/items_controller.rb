class ItemsController < ApplicationController
  before_action :move_to_session, only: [:new, :edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(params_item)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  private

  def params_item
    params.require(:item).permit(:name, :description, :category_id, :status_id, :ship_fee_id, :ship_area_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end
end
