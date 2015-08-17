# == Schema Information
#
# Table name: booked_activities
#
#  id          :integer          not null, primary key
#  customer_id :integer          not null
#  date        :datetime         not null
#  activity_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  party_size  :integer          not null
#

class BookedActivity < ActiveRecord::Base
  belongs_to :customer,
  foreign_key: :customer_id,
  class_name: :User

  belongs_to :activity,
  foreign_key: :activity_id,
  class_name: :Activity

  validates :customer, :date, :activity, :party_size, presence: true
end
