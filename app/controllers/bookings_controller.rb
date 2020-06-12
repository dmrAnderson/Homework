class BookingsController < ApplicationController
  def show
    @customer = Customer.find_by(id: params[:id])
    @booking = @customer.booking
    @cleaner = Cleaner.find(@booking.cleaner_id)
  end
end
