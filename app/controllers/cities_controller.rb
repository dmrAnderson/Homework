class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to @city, notice: 'City was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @city.destroy
    redirect_to cities_url, notice: 'City was successfully destroyed.'
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name)
    end
end
