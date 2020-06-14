class CustomersController < ApplicationController
  before_action :is_it_a_new_customer?, only: :create
  before_action :free_cleaners_on_this_date, only: :create
  before_action :instance_variables_for_customer, only: %i[new create]

  def index; end

  def show
    @customer = Customer.find_by(id: params[:id])
    @booking = @customer.booking
    @cleaner = Cleaner.find(@booking.cleaner_id)
  end

  def new; end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      @customer.booking.update(cleaner_id: @best_cleaner.id)
      redirect_to @customer, notice: "Booking was successfully created."
    else
      render :new
    end
  end

  private

    def free_cleaners_on_this_date
      date = customer_params[:booking_attributes][:date]
      bookings_on_this_date = Booking.where(date: date)
      free_cleaners_on_this_date = Cleaner.where.not(id: bookings_on_this_date.pluck(:cleaner_id))
      if free_cleaners_on_this_date.any?
        workplaces_in_this_city = Workplace.where(city_id: customer_params[:booking_attributes][:city_id])
        found_cleaners = free_cleaners_on_this_date.where(id: workplaces_in_this_city.pluck(:cleaner_id))
        if found_cleaners.any?
          @best_cleaner = found_cleaners.first
        else
          redirect_to :root, notice: "Unfortunately, we haven't any free cleaner in your city."
        end
      else
        redirect_to :root, notice: "Unfortunately, we haven't any free cleaner on this date."
      end
    end

    def is_it_a_new_customer?
      if customer = Customer.find_by(phone_number: customer_params[:phone_number])
        redirect_to customer, notice: "You already have a booking."
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
