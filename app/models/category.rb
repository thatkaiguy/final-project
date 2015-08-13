class Category < ActiveRecord::Base
  validates :label, presence: true
end
