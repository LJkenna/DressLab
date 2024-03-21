class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @item = Item.find(@booking.item_id)
  end

  def create
    @user = User.find(current_user.id)
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    @booking.item_id = @item.id
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private


  def booking_params
    params.require(:booking).permit(:rent_end_date, :rent_start_date)
  end
end
