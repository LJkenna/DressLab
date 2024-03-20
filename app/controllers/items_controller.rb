class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @user = User.find(params[:user_id])
    @item = Item.new(item_params)
    @item.user = @user
    if @item.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:brand, :size, :type, :color, :price, :status)
  end
end
