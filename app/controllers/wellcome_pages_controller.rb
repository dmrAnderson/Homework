class WellcomePagesController < ApplicationController
  def index
    @customer = Customer.new
  end
end
