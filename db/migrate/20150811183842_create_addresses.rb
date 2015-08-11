class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address1, null: true
      t.string :address2, null: true
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.string :postal_code, null: false

      t.timestamps null: false
    end

    add_index :addresses,
      [:address1, :address2, :city, :state, :country, :postal_code],
      unique: true,
      name: 'addresses_must_be_unique'
  end
end
