class ItemsController < ApplicationController
  before_action :move_to_session, only: :new

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

  private

  def params_item
    params.require(:item).permit(:name, :description, :category_id, :status_id, :ship_fee_id, :ship_area_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end
end
