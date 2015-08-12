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

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
