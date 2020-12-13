class OrdersController < ApplicationController
  def place_order 

  end
  def order_params
    params.require(:order).permit(:total_price, :total_quantity, :status, :payment_mode, :user_id)
  end
end
