# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  address1    :string
#  address2    :string
#  city        :string           not null
#  state       :string           not null
#  postal_code :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
