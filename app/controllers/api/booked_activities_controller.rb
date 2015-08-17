class Api::BookedActivitiesController < ApplicationController
  def create
    @booked_activity = current_user.booked_activities.new(booked_activity_params)
    if @booked_activity.save
      render json: @booked_activity
    else
      render json: @booked_activity.errors.full_messages,
        status: :unprocessable_entity
    end
  end

  def index
    @booked_activities = current_user.booked_activities
    render json: @booked_activities
  end

  private

  def booked_activity_params
    if params[:booked_activity][:date]
      date_str = params[:booked_activity][:date]
      params[:booked_activity][:date] = DateTime.strptime(date_str, "%m/%d/%Y")
    end
    params.require(:booked_activity).permit(:activity_id, :date, :party_size)
  end
end
