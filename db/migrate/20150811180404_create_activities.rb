class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :creator_id, null: false
      t.integer :address_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :img_url, null: false
      t.integer :capacity, null: false

      t.timestamps null: false
    end

    add_index :activities, :title
    add_index :activities, :id
    add_index :activities, [:creator_id, :title], unique: true
  end
end
