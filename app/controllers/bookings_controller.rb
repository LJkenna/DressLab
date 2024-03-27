class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :accepted, :rejected]
  def index
    @rentpending = current_user.bookings.request_pending
    @rentaccepted = current_user.bookings.request_accepted
    @rentrejected = current_user.bookings.request_rejected
    @lendpending = current_user.items
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
    @booking.request_pending!
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

  def accepted
    @booking.request_accepted!
    redirect_to bookings_path
  end

  def rejected
    @booking.request_rejected!
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
