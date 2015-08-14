class Api::ReviewsController < ApplicationController
  def index
    if params[:activity_id]
      @reviews = Review.where(activity_id: params[:activity_id])
    else
      @reviews = Review.all
    end
    render :index
  end

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      render json: @review
    else
      render json: @review.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:num_stars, :body, :activity_id)
  end

end
