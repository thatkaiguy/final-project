class CreateBookedActivities < ActiveRecord::Migration
  def change
    create_table :booked_activities do |t|
      t.integer :customer_id, null: false
      t.datetime :date, null: false
      t.integer :activity_id, null: false


      t.timestamps null: false
    end

    add_foreign_key :booked_activities, :users, column: :customer_id
    add_foreign_key :booked_activities, :activities, column: :activity_id
  end
end
