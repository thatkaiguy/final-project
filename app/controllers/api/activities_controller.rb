class Api::ActivitiesController < ApplicationController
  def create
    @activity = current_user.offered_activities.new(activity_params)
    # TODO attach an address to the model before saving!!!

    if @activity.save
      render json: @activity
    else
      render json: @activity.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activty.try(:destroy)
    render json: {}
  end

  def show
    @activity = Activity.find(params[:id])
    render :show
  end

  private

  def activity_params
    params.require(:activity)
          .permit(:description, :img_url, :capacity, :title, :address_id)
  end
end
