class Api::CategoriesController < ApplicationController
  def create
    @category = Category.where(category_params).first_or_create
    if @category && @category.errors.full_messages.empty?
      render json: @category
    else
      render json: @category.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:label)
  end
end
