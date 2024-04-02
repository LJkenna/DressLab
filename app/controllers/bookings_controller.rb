class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :accepted, :rejected]
  def index
    @rentpending = current_user.bookings.request_pending
    @rentaccepted = current_user.bookings.request_accepted
    @rentrejected = current_user.bookings.request_rejected
    lendbookings = Booking.joins(:item).where(item: { user_id: current_user.id })
    @lendpending = lendbookings.request_pending
    @lendaccepted = lendbookings.request_accepted
    @lendrejected = lendbookings.request_rejected
  end

  def show
    @item = Item.find(@booking.item_id)
  end

  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)
    @booking.total_amount = total_amount(@item, @booking)
    @booking.user = User.find(current_user.id)
    @booking.item = @item
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

  def total_amount(item, booking)
    (booking.rent_end_date - booking.rent_start_date).to_i * item.price_per_day
  end
end
