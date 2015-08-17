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

require 'test_helper'

class CategoryLinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
