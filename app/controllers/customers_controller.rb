class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show destroy]
  before_action :new_customer?, only: :create

  def new
    @cities = City.all
    @customer = Customer.new
    @customer.build_booking
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save && free_cleaners = Cleaner.where(employed: false)
      find_cleaner_for(@customer.booking, free_cleaners)
      redirect_to bookings_show_customer_path(@customer.id), notice: "Booking was successfully created."
    else
      redirect_to :root, notice: "Unfortuanly we haven't any free cleaner for you."
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def find_cleaner_for(booking, free_cleaners)
      best_cleaner = free_cleaners.each { |c| c.workplaces.find_by(city_id: booking.city_id) }.first
      booking.update(cleaner_id: best_cleaner.id)
      best_cleaner.update(employed: true)
    end

    def set_customer
      @customer = Customer.find_by(phone_number: params[:id])
    end

    def new_customer?
      customer = Customer.find_by(phone_number: customer_params[:id])
      redirect_to bookings_show_customer_path(customer.id), notice: "This is your booking." if customer.present?
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :phone_number, booking_attributes: [:customer_id, :city_id, :date, :time])
    end
end
