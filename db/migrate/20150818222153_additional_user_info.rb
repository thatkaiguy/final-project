class AdditionalUserInfo < ActiveRecord::Migration
  def change
    add_column :users, :fname, :string, null: true
    add_column :users, :lname, :string, null: true
    add_column :users, :phone1, :string, null: true
    add_column :users, :phone2, :string, null: true
    add_column :users, :location, :string, null: true
  end
end
