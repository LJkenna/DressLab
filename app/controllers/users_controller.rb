class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
    #--
    @bookings = current_user.bookings
  end

  private

  def set_user
    @user = current_user
  end
end
