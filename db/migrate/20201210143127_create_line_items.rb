class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.belongs_to :user
      t.integer :price
      t.integer :quantity
      t.belongs_to :product
      t.date :canceled_at
      t.timestamps
    end
  end
end
