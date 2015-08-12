# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  creator_id  :integer          not null
#  address_id  :integer          not null
#  title       :string           not null
#  description :text             not null
#  img_url     :string           not null
#  capacity    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Activity < ActiveRecord::Base
  belongs_to :creator,
    foreign_key: :creator_id,
    class_name: :User

  belongs_to :address,
    foreign_key: :address_id,
    class_name: :Address

  # TODO reconsider required img_url
  validates :creator, :address, :title, :description, :img_url, presence: true
  validates_uniqueness_of :creator_id, scope: :title
  validates_numericality_of :capacity, greater_than_or_equal_to: 0
end
