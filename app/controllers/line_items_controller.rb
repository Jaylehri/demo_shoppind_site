class LineItemsController < ApplicationController
  before_action :create_order, only:[:create]
  before_action :set_product , only: [:destroy, :update]
  before_action :set_product_line_item , only: [:update, :destroy]
  # before_action :set_order, only: [:show, :edit, :update, :destroy]
  # after_action :update_line_item, only: [:create]

  def index
    @line_items =LineItem.all
  end

  def create
    @line_item = @order.line_items.new(line_item_params)
    @line_item.user_id = current_user.id
   
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to line_items_path, notice: 'Line item was successfully created.' }
      end
     
   end
  end

   def update
  # binding.pry
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to line_items_path, notice: 'Line item was successfully updated.' }
      end 
    end
  end

  def destroy 

    @line_item = @product.line_items.find(params[:id])
    @line_item.destroy
    respond_to do |format|
    format.html { redirect_to line_items_path, notice: 'Line item was successfully destroyed.' }
     end 
  end


  private

   # def update_line_item 
   #  binding.pry
   #    @total_quantity = LineItem.where(product_id: product.id).sum('quantity')
   #    @line_item = LineItem.find_by(product_id: prouct.id)
   #   # @user = current_user.id
   #    @total_price =  LineItem.where(product_id: product.id).sum('price')
   #   #price = @order.total_price + line_item.price
   #    @line_item.update(price: @total_price, quantity:@total_quantity)
   # end
  
    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_product_line_item
      @line_item = @product.line_items.find(params[:id])
    end

    # def set_line_item 
    #   @line_item = @order.line_items.find(params[:id])
    # end
    
    def line_item_params
      params.require(:line_item).permit(:product_id, :quantity, :user_id, :order_id)
    end

    def create_order

      @order = current_user.orders.where(status: 0).first
      if @order.present?
         @order = Order.find(params[:order_id])
      else
         @order = Order.create(status: 0)
      end
      @order
    end
end
