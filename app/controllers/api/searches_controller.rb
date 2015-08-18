class Api::SearchesController < ApplicationController
  def index
    if params[:city] && params[:category]
      @activities = Activity.joins(:address, :categories)
        .where('addresses.city ILIKE ?', "%#{params[:city]}%")
        .where('categories.label ILIKE ?', "%#{params[:category]}%")
    elsif params[:city]
      @activities = Activity.joins(:address)
        .where('addresses.city ILIKE ?', "%#{params[:city]}%")
    elsif params[:category]
      @activities = Activity.joins(:categories)
        .where('categories.label ILIKE ?', "%#{params[:category]}%")
    end

    if @activities.nil?
      @activities = [Activity.new]
    end

    render :index
  end
end
