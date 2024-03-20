class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    #--
  end

  def create
    @user = User.find(current_user.id)
    @item = Item.new(item_params)
    @item.user_id = @user.id
    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:brand, :size, :color, :price_per_day, :category, :description, status: 1)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
