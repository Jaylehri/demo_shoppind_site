class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.integer :total_quantity
      t.string :status
      t.string :payment_mode
      t.belongs_to :user

      t.timestamps
    end
  end
end
