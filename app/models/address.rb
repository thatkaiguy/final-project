class Address < ActiveRecord::Base
  validates :city, :state, :country, :postal_code, presence: true
  validates_uniqueness_of :city, scope: { :state, :country, :postal_code }
end
