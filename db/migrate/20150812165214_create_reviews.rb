class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :author_id, null: false
      t.integer :num_stars, null: false
      t.text :body, null: true
      t.integer :activity_id, null: false

      t.timestamps null: false
    end

    add_index :reviews, [:author_id, :activity_id], unique: true
    add_foreign_key :reviews, :users, column: :author_id, primary_key: "id"
  end
end
