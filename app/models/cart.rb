class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  # def add_product(product)
  #   current_item = line_item.find_by(product_id: product.id)
  #   if current_item
  #     current_item.increment(:quantity)
  #   else
  #     current_item = line_item.build(product_id: product.id)
  #   end
  #   current_item

  # end
end
