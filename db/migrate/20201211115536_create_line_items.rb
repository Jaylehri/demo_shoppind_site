class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.belongs_to :user
      t.integer :price
      t.integer	:quantity, default: 1
      t.references :product,foreign_key: true
      t.date :canceled_at 
      t.belongs_to :cart, foreign_key: true

      t.timestamps
    end
  end
end
