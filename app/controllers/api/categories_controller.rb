class Api::CategoriesController < ApplicationController
  def create
    if @category = Category.find_or_create(category_params)
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
