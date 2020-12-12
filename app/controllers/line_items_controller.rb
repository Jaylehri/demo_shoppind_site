class LineItemsController < ApplicationController
  # include CurrentCart \
  before_action :set_product , only: [:show, :create, :destroy]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  # before_action :set_cart, only: [:create]
  # GET /line_items
  # GET /line_items.json
  def index 
  
     @line_items = LineItem.all
  
    
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    
    # @line_item = @cart.add_product(product)
   
    # @product = Product.find(params[:product_id])
    # @price = @product.price
    @line_item = @product.line_items.create(line_item_params)
    # @line_item.product_id = params[:id]
    @line_item.user_id = current_user.id
    @line_item.price = @product.price*@line_item.quantity

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

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
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

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    # @cart = Card.find(session[:cart_id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to product_line_item_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
       @product = Product.find(params[:product_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = @product.line_items.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id, :user_id, :quantity, :price, :canceled_at)
    end
end
