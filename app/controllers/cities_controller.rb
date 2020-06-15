class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @cleaners = @city.cleaners
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to cities_path, notice: 'City was successfully created.'
    else
      render :new
    end
  end

  def destroy
    City.find(params[:id]).destroy
    redirect_to cities_url, notice: 'City was successfully destroyed.'
  end

  private
    def city_params
      params.require(:city).permit(:name)
    end
end
