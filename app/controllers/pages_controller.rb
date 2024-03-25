class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home :index]
  def home
  end



  def show
    #--
    @current_user = current_user
    @bookings = current_user.bookings
    @items = current_user.items
  end
end
