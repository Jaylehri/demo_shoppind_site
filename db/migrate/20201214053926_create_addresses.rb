class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user,foreign_key: true
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country
      t.integer :postal_code

      t.timestamps
    end
  end
end
