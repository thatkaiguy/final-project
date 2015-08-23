class Api::SearchesController < ApplicationController
  def index
    if !(params[:city].blank? && params[:category].blank?)
      @activities = Activity.joins(:address, :categories)
        .where('addresses.city ILIKE ?', "%#{params[:city]}%")
        .where('categories.label ILIKE ?', "%#{params[:category]}%")
    elsif !(params[:city].blank?)
      @activities = Activity.joins(:address)
        .where('addresses.city ILIKE ?', "%#{params[:city]}%")
    elsif !(params[:category].blank?)
      @activities = Activity.joins(:categories)
        .where('categories.label ILIKE ?', "%#{params[:category]}%")
    end
    
    if @activities.nil?
      @activities = Activity.limit(3).all
    end

    render :index
  end
end
