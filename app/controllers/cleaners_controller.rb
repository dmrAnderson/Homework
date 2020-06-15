class CleanersController < ApplicationController

  def index
    @cleaners = Cleaner.all
  end

  def show
    @cleaner = Cleaner.find(params[:id])
    @workplaces = @cleaner.cities
    @bookings = @cleaner.bookings
  end

  def new
    @cleaner = Cleaner.new
    @cities = City.all
    @cleaner.workplaces.build
  end

  def create
    @cleaner = Cleaner.new(cleaner_params)
    if @cleaner.save
      redirect_to @cleaner, notice: 'Cleaner was successfully created.'
    else
      @cities = City.all
      @cleaner.workplaces.build
      render :new
    end
  end

  def destroy
    Cleaner.find(params[:id]).destroy
    redirect_to cleaners_url, notice: 'Cleaner was successfully destroyed.'
  end

  private

    def cleaner_params
      params.require(:cleaner).permit(
        :first_name, :last_name, :quality_scope, :employed,
        workplaces_attributes: [:city_id]
      )
    end
end
