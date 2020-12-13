class LineItem < ApplicationRecord
  before_create :set_price
  # before_create :create_order
  belongs_to :product
  belongs_to :user
  belongs_to :order

  def set_price
     # self.order_id = 1
    self.price = product.price*quantity
  end

  # def create_order
  #  @user_id = current_user.id
  #  total_price = line_items.where(user_id: user.id).sum('price')
  #  Order.create(user_id: 1,total_price: 100 )
  # end

end
