class Api::CitiesController < ApplicationController
  def unique_cities
    @cities = Address.group(:city).pluck(:city)
    render :unique_cities
  end
end
