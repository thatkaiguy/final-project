class Api::CategoryLinksController < ApplicationController
  def create
    @category_link = CategoryLink.new(category_link_params)
    if @category_link.save
      render json: @category_link
    else
      render json: @category_link.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def category_link_params
    params.require(:category_link).permit(:activity_id, :category_id)
  end
end
