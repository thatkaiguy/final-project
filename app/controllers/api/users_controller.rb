class Api::UsersController < ApplicationController
  def show
    @user = User.includes(:booked_activities).find_by(id: params[:id])
    render :show
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render :show
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :fname, :lname, :email, :phone1, :phone2, :location)
  end
end
