class LineItem < ApplicationRecord
  before_create :set_price
  before_update :set_price
  belongs_to :product
  belongs_to :user
  belongs_to :order

  def set_price

    self.price = product.price*quantity
  end

  def update_line_item 
    #binding.pry
    @total_quantity = LineItem.where(product_id: product.id).sum('quantity')
    @line_item = LineItem.find_by(product_id: product.id)
    @total_price =  LineItem.where(product_id: product.id).sum('price')
    @line_item.update(price: @total_price, quantity:@total_quantity)
  end
end
