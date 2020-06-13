class CustomersController < ApplicationController
  before_action :is_it_a_new_customer?, only: :create
  before_action :check_and_find_free_cleaners_in, only: :create
  before_action :instance_variables_for_customer, only: %i[new create]

  def index
    
  end

  def show
    @customer = Customer.find_by(id: params[:id])
    @booking = @customer.booking
    @cleaner = Cleaner.find(@booking.cleaner_id)
  end

  def new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      find_cleaner_for(@customer.booking, @free_cleaners)
      redirect_to @customer, notice: "Booking was successfully created."
    else
      render :new
    end
  end

  private

  

    def check_and_find_free_cleaners_in
      date = customer_params[:booking_attributes][:date]
      bookings_in_this_day = Booking.where(date: date)
      @free_cleaners = Cleaner.where.not(id: bookings_in_this_day.pluck(:cleaner_id))
      if @free_cleaners.any?
        @free_cleaners
      else
        redirect_to :root, notice: "Unfortunately, we haven't any free cleaner on this date."
      end
    end

    def find_cleaner_for(booking, free_cleaners)
      workplaces = free_cleaners.map { |c| c.workplaces.find_by(city_id: booking.city_id) }
      if workplaces.any?
        best_cleaner = workplaces.first.cleaner
        booking.update(cleaner_id: best_cleaner.id)
      else
        redirect_to :root, notice: "Unfortunately, we haven't any free cleaner in your city."
      end
    end

    def is_it_a_new_customer?
      if customer = Customer.find_by(phone_number: customer_params[:phone_number])
        redirect_to customer, notice: "This is your booking."
      end
    end

    def instance_variables_for_customer
      @customer = Customer.new
      @cities = City.all
      @customer.build_booking
    end

    def customer_params
      params.require(:customer).permit(
        :first_name, :last_name, :phone_number,
        booking_attributes: [:id, :customer_id, :city_id, :date, :time]
      )
    end
end
