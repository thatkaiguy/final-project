class CategoryLink < ActiveRecord::Base
  belongs_to :category
  belongs_to :activity

  validates :category, :activity, presence: true
end
