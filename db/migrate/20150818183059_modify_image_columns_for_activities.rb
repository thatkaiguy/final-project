class ModifyImageColumnsForActivities < ActiveRecord::Migration
  def change
    add_column :activities, :img_url_full_size, :string, null: true
    add_column :activities, :img_url_small_size, :string, null: true
  end
end
