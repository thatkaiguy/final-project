class ChangeReviews < ActiveRecord::Migration
  def change
    change_column :reviews, :num_stars, :decimal, null: false
  end
end
