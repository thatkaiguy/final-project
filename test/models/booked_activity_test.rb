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

require 'test_helper'

class BookedActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
