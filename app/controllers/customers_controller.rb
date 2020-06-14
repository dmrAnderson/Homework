class CustomersController < ApplicationController
  before_action :check_customer, only: :create
  before_action :find_best_cleaner, only: :create
  before_action :new_customer, only: %i[new create]

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

    def find_best_cleaner
      workplaces = Workplace.where(city_id: customer_params[:booking_attributes][:city_id])
      cleaners_who_work_in_this_city = Cleaner.where(id: workplaces.pluck(:cleaner_id))
      if cleaners_who_work_in_this_city.any?
        date = customer_params[:booking_attributes][:date]
        bookings_on_this_date = Booking.where(date: date)
        free_cleaners_on_this_date = cleaners_who_work_in_this_city.where.not(id: bookings_on_this_date.pluck(:cleaner_id))
        if free_cleaners_on_this_date.any?
          @best_cleaner = free_cleaners_on_this_date.first
        else
          redirect_to :root, notice: "Unfortunately, we haven't any free cleaner on this date."
        end
      else
        redirect_to :root, notice: "Unfortunately, we haven't any free cleaner in your city."
      end
    end

    def check_customer
      if customer = Customer.find_by(phone_number: customer_params[:phone_number])
        redirect_to customer, notice: "You already have a booking."
      end
    end

    def new_customer
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
