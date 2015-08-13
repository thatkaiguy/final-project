class Api::SearchesController < ApplicationController
  def index
    @activities = Activity.where('city ILIKE ?', params[:city])
  end
end
