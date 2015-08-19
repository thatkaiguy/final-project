class AddPriceColumnToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :price, :decimal, null: false, default: 0
  end
end
