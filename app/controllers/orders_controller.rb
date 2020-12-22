class OrdersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @orders = @user.orders.all
  end
    
  def select_payment_mode
  end

  def place_order
    @order = Order.new(order_params) 
    @total_quantity = LineItem.where(user_id: current_user.id).sum('quantity')
    @total_price =  LineItem.where(user_id: current_user.id).sum('price')
    current_user.latest_order.update(total_price: @total_price, 
      status: 'payment',total_quantity:@total_quantity, payment_mode: @order.payment_mode)
    redirect_to orders_path
 end
 
 def total_revanue 
  
    @sold_product_total_quantity = Order.joins(line_items: :product).where("products.user_id = ? ", current_user.id).where(status:'payment').sum("line_items.quantity")
    @sold_product_total_price =  Order.joins(line_items: :product).where("products.user_id = ? ", current_user.id).where(status:'payment').sum("products.price*quantity")
  end


  private

    def order_params
      params.require(:order).permit(:total_price, :total_quantity, :status, :payment_mode, :user_id)
    end
end
