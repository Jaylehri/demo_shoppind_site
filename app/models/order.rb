class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  # before_create :total_price
  
  # def total_price
  #   self.total_price = line_items.price*quantity
  # end

end
