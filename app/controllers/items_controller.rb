class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all
    if params[:query].present?
      sql_subquery = "brand @@ :query OR garment_type @@ :query OR color @@ :query OR description @@ :query"
      @items = @items.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def new
    @item = Item.new
  end

  def show
    @booking = Booking.new
    #--
  end

  def edit
    #--
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
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

  def destroy
    @item = Item.find(params[:id])
    if @item.bookings.count.positive?
      redirect_to profile_path
      flash.alert = "Item part of booking. Unable to delete"
    else
      @item.destroy
      redirect_to profile_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:brand, :size, :color, :price_per_day, :garment_type, :description, :photo, status: 1)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
