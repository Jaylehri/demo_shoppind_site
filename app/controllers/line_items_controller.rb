class LineItemsController < ApplicationController
  # include CurrentCart \
  before_action :create_order, only: [:create]
  before_action :set_product , only: [:show, :create, :destroy]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  # before_action :set_cart, only: [:create]
 
  def index 
  
     @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    
    # @line_item = @cart.add_product(product)
   
    # @product = Product.find(params[:product_id])
    # @price = @product.price
    @line_item = @product.line_items.create(line_item_params)
    @line_item.order_id = @order.id
    # @line_item.product_id = params[:id]
    @line_item.user_id = current_user.id
    # @line_item.price = @product.price*@line_item.quantity
    
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to   product_line_items_path, notice: 'Item added to cart.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # @cart = Card.find(session[:cart_id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to product_line_items_path, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def create_order
      @user = current_user.id
     # total_price = line_items.where(user_id: user.id).sum('price')
    @order = Order.create(user_id:@user,total_price: 100 )
  end

    def set_product
       @product = Product.find(params[:product_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = @product.line_items.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:product_id,  :user_id, :order_id, :quantity, :price, :canceled_at)
    end
end
