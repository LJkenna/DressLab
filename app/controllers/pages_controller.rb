class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def profile
    @current_user = current_user
    @bookings = current_user.bookings
    @items = current_user.items
    @rentpending = current_user.bookings.request_pending
    @rentaccepted = current_user.bookings.request_accepted
    @rentrejected = current_user.bookings.request_rejected
    lendbookings = Booking.joins(:item).where(item: { user_id: current_user.id })
    @lendpending = lendbookings.request_pending
    @lendaccepted = lendbookings.request_accepted
    @lendrejected = lendbookings.request_rejected
  end
end
