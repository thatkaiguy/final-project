# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  author_id   :integer          not null
#  num_stars   :decimal(, )      not null
#  body        :text
#  activity_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ActiveRecord::Base
  after_initialize :set_defaults

  belongs_to :author,
  foreign_key: :author_id,
  class_name: :User

  belongs_to :activity,
  foreign_key: :activity_id,
  class_name: :Activity

  validates :author, :activity, presence: true
  validates_numericality_of :num_stars, in: 0..5

  def set_defaults
    self.num_stars ||= 0
  end
end
