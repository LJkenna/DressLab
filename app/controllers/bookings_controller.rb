class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  def index
    @bookings = current_user.bookings
  end

  def show
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

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:rent_end_date, :rent_start_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
