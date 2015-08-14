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
  has_many :activities,
  foreign_key: :address_id,
  class_name: :Activity

  validates :city, :state, :postal_code, presence: true
  validates_uniqueness_of :city,
    scope: [ :address1, :address2, :state, :postal_code ]
end
