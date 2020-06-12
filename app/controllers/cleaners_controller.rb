class CleanersController < ApplicationController
  before_action :new_cleaner, except: :show
  def index
    @cleaners = Cleaner.all
  end

  def show
    @cleaner = Cleaner.find(params[:id])
    @workplaces = City.where(id: @cleaner.workplaces.pluck(:city_id))
  end

  def new
    @cities = City.all
    @cleaner.workplaces.build
  end

  def create
    @cleaner = Cleaner.new(cleaner_params)
    if @cleaner.save
      redirect_to @cleaner, notice: 'Cleaner was successfully created.'
    else
      render :new
    end
  end

  private
    def new_cleaner
      @cleaner = Cleaner.new
    end

    def cleaner_params
      params.require(:cleaner).permit(
        :first_name, :last_name, :quality_scope, :employed,
        workplaces_attributes: [:city_id]
      )
    end
end
