class OrdersController < ApplicationController
  # before_action :set_order, only: [:show, :edit, :update, :destroy]
  # after_action :destroy_line_items , only: [:index]
  # after_action :update_order, only: [:create]
  
  # def create 
  #  # binding.pry
  #   @order = Order.new(order_params)  
  #   @order.user_id = current_user.id
  #   respond_to do |format|
  #     if @order.save
  #       format.html { redirect_to orders_path, notice: 'Order place successfully created.' }
  #     end
  #   end
  # end

  

  def index
    @user = User.find(current_user.id)
    @orders = @user.orders.all
  end
    
  def select_payment_mode
  end

  def place_order
     @order = Order.new(order_params) 
    @total_quantity = LineItem.where(user_id: current_user.id).sum('quantity')
     # @order = Order.find_by(user_id: current_user.id)
     # @user = current_user.id
    @total_price =  LineItem.where(user_id: current_user.id).sum('price')
     #price = @order.total_price + line_item.price
    current_user.latest_order.update(total_price: @total_price, 
      status: 'place',total_quantity:@total_quantity, payment_mode: @order.payment_mode)
    redirect_to orders_path
 end

  # def show
  # end

  # def new
  #   @order = Order.new
  # end

  # def edit
  # end

  # def create
  #   @order = Order.new(Order_params)

  #   respond_to do |format|
  #     if @order.save
  #       format.html { redirect_to @order, notice: 'Cart was successfully created.' }
  #     end
  #   end
  # end

  # def update

  #    respond_to do |format|
  #     if @order.update(order_params)
  #      format.html { redirect_to @order, notice: 'Cart was successfully created.' }
      
  #     else
  #       format.html { render :edit }
  #     end
  #   end
  # end

 
  # def destroy
   
  #   @order.destroy 
  #   respond_to do |format|
  #     format.html { redirect_to orders_url, notice: 'Cart was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
   

  def update_order 
     @total_quantity = LineItem.where(user_id: current_user.id).sum('quantity')
     # @order = Order.find_by(user_id: current_user.id)
     # @user = current_user.id
     @total_price =  LineItem.where(user_id: current_user.id).sum('price')
     #price = @order.total_price + line_item.price
    current_user.latest_order.update(total_price: @total_price, 
      status: 'place',total_quantity:@total_quantity, payment_mode: @order.payment_mode)
  end

  def order_params
    params.require(:order).permit(:total_price, :total_quantity, :status, :payment_mode, :user_id)
  end
  

end
