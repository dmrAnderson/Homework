class CustomersController < ApplicationController
  before_action :new_customer, only: :create

  def show
    @customer = Customer.find_by(id: params[:id])
    @booking = @customer.booking
    @cleaner = Cleaner.find(@booking.cleaner_id)
  end

  def new
    @cities = City.all
    @customer = Customer.new
    @customer.build_booking
  end

  def create
    @customer = Customer.new(customer_params)
    
    if @customer.save && !(free_cleaners = Cleaner.where(employed: false)).empty?
      find_cleaner_for(@customer.booking, free_cleaners)
      redirect_to @customer, notice: "Booking was successfully created."
    else
      redirect_to :root, notice: "Unfortuanly we haven't any free cleaner for you city."
    end
  end

  private
    def find_cleaner_for(booking, free_cleaners)
      best_cleaner = free_cleaners.each { |c| c.workplaces.find_by(city_id: booking.city_id) }.first
      booking.update(cleaner_id: best_cleaner.id)
      best_cleaner.update(employed: true)
    end

    def new_customer
      if customer = Customer.find_by(phone_number: customer_params[:phone_number])
        redirect_to customer, notice: "This is your booking."
      end
    end

    def customer_params
      params.require(:customer).permit(
        :first_name, :last_name, :phone_number,
        booking_attributes: [:id, :customer_id, :city_id, :date, :time]
      )
    end
end
