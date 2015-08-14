class Category < ActiveRecord::Base
  validates :label, presence: true
  has_many :category_links
end
