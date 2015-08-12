class Api::ReviewsController < ApplicationController
  def index
    if params[:activity_id]
      @reviews = Review.where(activity_id: params[:activity_id])
    else
      @reviews = Review.all
    end
    render :index
  end

end
