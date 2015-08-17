class Api::UsersController < ApplicationController
  def show
    @user = User.includes(:booked_activities).find_by(id: params[:id])
    render :show
  end
end
