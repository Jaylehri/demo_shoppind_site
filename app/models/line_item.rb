class LineItem < ApplicationRecord
  before_create :set_price
 
 # before_create :create_order
  #after_create :update_order
  # after_destroy :destroy_order
  after_create :update_order_line_item
  # before_create :create_order
  belongs_to :product
  belongs_to :user
  belongs_to :order

  def set_price
     # self.order_id = 1
    self.price = product.price*quantity
  end

  def update_line_item 
     binding.pry
    @total_quantity = LineItem.where(product_id: product.id).sum('quantity')
    @line_item = LineItem.find_by(product_id: product.id)
    # @user = current_user.id
    @total_price =  LineItem.where(product_id: product.id).sum('price')
    #price = @order.total_price + line_item.price
    @line_item.update(price: @total_price, quantity:@total_quantity)
  end


  # def destroy_order
    
  #   @user = current_user.id
  #   user = User.find(@user)
  #   if(user.line_items.present?)
  #     @user = current_user.id
  #     @order = Order.find_by(user_id: current_user.id)
  #     @total_quantity = LineItem.where(user_id: @user).sum('quantity')
  #     @total_price =  LineItem.where(user_id: @user).sum('price')
  #    # line_item = LineItem.find_by(user_id: current_user.id)
  #    # price = @order.total_price - line_item.price
  #     @order.update(total_price: @total_price, total_quantity: @total_quantity)
  #  else
  #     @order = Order.find_by(user_id:@user)
  #     @order.destroy
  #   end
  # end


  def update_order_line_item

    self.quantity = LineItem.where(product_id: product.id).sum('quantity')

    #   @line_item = LineItem.find(product_id: product.id)
    #   @quantity = LineItem.where(product_id: product.id).sum('quantity')
    #   @line_item.update(quantity: @quantity)
    # if @line_item.product.id
    #   @line_item.update(quantity: self.quantity)
    # end
    #  @total_quantity = LineItem.where(user_id: @user).sum('quantity')
    #  @order = Order.find_by(user_id: current_user.id)
    #  @user = current_user.id
    #  @total_price =  LineItem.where(user_id: @user).sum('price')
    #  #price = @order.total_price + line_item.price
    #  @order.update(total_price: @total_price, status: 'cart',total_quantity:@total_quantity)

  end

  # def create_order
  #   @user = current_user.id
  #   user = User.find(@user)
  #   if(user.line_items.present?)
  #     @order = Order.find_by(user_id: @user)
  #     @total_price = LineItem.where(user_id: @user).sum('price')
  #     @order.update(total_price: @total_price)
  #   else
  #     @total_price = LineItem.where(user_id: @user).sum('price')
  #   # @total_quantity = line_items.wh 
  #     @order = Order.create(user_id:@user,total_price:@total_price, status: 'cart'  )
  #   end
  # end

  # def create_order
  #  @user_id = current_user.id
  #  total_price = line_items.where(user_id: user.id).sum('price')
  #  Order.create(user_id: 1,total_price: 100 )
  # end

end
