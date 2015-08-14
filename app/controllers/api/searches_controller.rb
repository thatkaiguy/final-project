class Api::SearchesController < ApplicationController
  def index
    
    @activities = Activity.joins(:address)
      .where('addresses.city ILIKE ?', "%#{params[:city]}%")

    if @activities.nil?
      @activities = Activity.all
    end

    render :index
  end
end
