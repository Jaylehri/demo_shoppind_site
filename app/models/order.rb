class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  # after_create :update_order

  # before_create :total_price

  
  # def total_price

  #   self.total_price = line_items.price*quantity
  # end
     
  def update_order
   binding.pry
   @order = Order.find_by(user_id: current_user.id )
   self.quantity = LineItem.where(user_id: current_user.id).sum('quantity')
   @total_price =  LineItem.where(user_id: current_user.id).sum('price')
   @order.update(total_price:@total_price )
    
  end

end
