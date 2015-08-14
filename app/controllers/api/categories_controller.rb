class Api::CategoriesController < ApplicationController
  def create
    fail
    @category = Category.new(category_params)
    if @category.save
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
