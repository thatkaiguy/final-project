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

class Address < ActiveRecord::Base
  validates :city, :state, :postal_code, presence: true
  validates_uniqueness_of :city, scope: [ :state, :postal_code ]
end
