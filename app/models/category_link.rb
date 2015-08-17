# == Schema Information
#
# Table name: category_links
#
#  id          :integer          not null, primary key
#  category_id :integer          not null
#  activity_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CategoryLink < ActiveRecord::Base
  belongs_to :category
  belongs_to :activity

  validates :category, :activity, presence: true
end
