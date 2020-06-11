class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show
    @booking = @customer.booking
  end

  def new
    @cities = City.all
    @customer = Customer.new
    @customer.build_booking
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    # redirect_to :show if @customer.booking.present?

    respond_to do |format|
      if current_customer = @customer.save
        find_cleaner_for(current_customer)
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_cleaner_for(customer)
      free_cleaners = Cleaner.all.order(quality_scope: :desc).where(employed: false)
      best_cleaner = free_cleaners.each { |c| c.workplaces.where(city_id: customer.booking.city_id) }.first
      customer.booking.update(city_id: best_cleaner.id)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :phone_number, booking_attributes: [:customer_id, :city_id, :date, :time])
    end
end
