class AddPartySizeToBookedActivities < ActiveRecord::Migration
  def change
    add_column :booked_activities, :party_size, :integer, null: false
  end
end
