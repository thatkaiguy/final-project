# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  label      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  validates :label, presence: true
  has_many :category_links
end
