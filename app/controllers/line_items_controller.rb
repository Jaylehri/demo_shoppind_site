class LineItemsController < ApplicationController
  def addtocart
    
  end

  private
  def line_item_params
    params.require(:lin_item).permit(:price, :quantity, :canceled_at)
  end
end
