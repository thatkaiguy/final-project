class CreateCategoryLinks < ActiveRecord::Migration
  def change
    create_table :category_links do |t|
      t.integer :category_id, null: false
      t.integer :activity_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :category_links, :categories, column: :category_id
    add_foreign_key :category_links, :activities, column: :activity_id
  end
end
