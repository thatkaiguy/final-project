class Api::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    @category = Category.where(category_params).first_or_create
    if @category && @category.errors.full_messages.empty?
      render json: @category
    else
      render json: @category.errors.full_messages, status: :unprocessable_entity
    end
  end

  def by_label
    @category_labels = Category.all.pluck(:label)
    render json: @category_labels
  end

  private

  def category_params
    params.require(:category).permit(:label)
  end
end
